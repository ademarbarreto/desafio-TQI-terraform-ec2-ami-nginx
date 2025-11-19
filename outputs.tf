output "primary_instance_id" {
  description = "ID da instância EC2 original"
  value       = aws_instance.primary.id
}


output "primary_public_ip" {
  description = "IP público da instância original"
  value       = aws_instance.primary.public_ip
}


output "custom_ami_id" {
  description = "AMI personalizada criada a partir da instância"
  value       = aws_ami_from_instance.custom_ami.id
}


output "from_ami_instance_id" {
  description = "ID da instância criada a partir da AMI personalizada"
  value       = aws_instance.from_custom_ami.id
}


output "from_ami_public_ip" {
  description = "IP público da instância criada a partir da AMI"
  value       = aws_instance.from_custom_ami.public_ip
}