variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "aws_profile" {
  description = "AWS CLI profile name (opcional)"
  type        = string
  default     = "default"
}


variable "instance_type" {
  description = "Tipo de instância EC2 (Free Tier: t2.micro / t3.micro dependendo da região)"
  type        = string
  default     = "t2.micro"
}


variable "ssh_public_key_path" {
  description = "Caminho para a chave pública SSH que será importada como Key Pair EC2"
  type        = string
  default     = "~/.ssh/terraform_demo.pub"
}


variable "name_prefix" {
  description = "Prefixo para nomes de recursos"
  type        = string
  default     = "tf-ec2-ami"
}


variable "ebs_size_gb" {
  description = "Tamanho do volume root (GB)"
  type        = number
  default     = 8
}


variable "ssh_username" {
  description = "Username do AMI Ubuntu (para cloud-init/outputs)"
  type        = string
  default     = "ubuntu"
}