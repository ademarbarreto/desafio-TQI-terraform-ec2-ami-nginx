# 1) Local lookup: última AMI oficial do Ubuntu (Canonical)
data "aws_ami" "ubuntu_latest" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
}


# 2) Importa/Cria Key Pair EC2 a partir da sua chave pública local
resource "aws_key_pair" "deployed_key" {
  key_name   = "${var.name_prefix}-key"
  public_key = file(var.ssh_public_key_path)
}

# 3) Security Group: permitir SSH (22) e HTTP (80)
resource "aws_security_group" "web_sg" {
  name        = "${var.name_prefix}-sg"
  description = "Allow SSH and HTTP"


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 4) EC2 original (onde instalamos nginx) - Root EBS limitado a 8GB (free tier)
resource "aws_instance" "primary" {
  ami                    = data.aws_ami.ubuntu_latest.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployed_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = file("nginx-cloud-init.sh")


  root_block_device {
    volume_size           = var.ebs_size_gb
    volume_type           = "gp3"
    delete_on_termination = true
  }


  tags = {
    Name = "${var.name_prefix}-primary"
  }
}

# 5) Criar uma AMI a partir desta instância (criando imagem personalizada)
resource "aws_ami_from_instance" "custom_ami" {
  name = "tf-ec2-ami-${formatdate("YYYYMMDD-hhmmss", timestamp())}"
  source_instance_id      = aws_instance.primary.id
  snapshot_without_reboot = true
  depends_on              = [aws_instance.primary]
}


# 6) Nova EC2 criada a partir da AMI personalizada
resource "aws_instance" "from_custom_ami" {
  ami                    = aws_ami_from_instance.custom_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployed_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]


  root_block_device {
    volume_size           = var.ebs_size_gb
    volume_type           = "gp3"
    delete_on_termination = true
  }


  tags = {
    Name = "${var.name_prefix}-from-ami"
  }


  depends_on = [aws_ami_from_instance.custom_ami]
}


# Optional: Para maior segurança em produção, considerar:
# - não liberar 0.0.0.0/0 para SSH, usar blocos de IP específicos
# - usar IAM roles e instance profiles se instâncias precisarem acessar AWS