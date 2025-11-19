# Desafio Bootcamp TQI: Gerenciando Instâncias EC2 na AWS

## ▶️ Objetivo

Criar EC2 (Ubuntu + NGINX) no Free Tier, gerar AMI customizada terraform-ec2-ami e criar uma nova instância a partir da AMI, usando Terraform.

## ▶️ Conteúdo

- providers.tf
- main.tf
- variables.tf
- outputs.tf
- install_nginx.sh
- .gitignore

## ▶️ Estrutura de diretório do projeto

terraform-ec2-ami-nginx/
├─ main.tf

├─ providers.tf

├─ variables.tf

├─ outputs.tf

├─ install_nginx.sh

├─ .gitignore

└─ README.md

└─ id_rsa (gerada localmente, **não comitar**)


## ▶️ Pré-requisitos


- Conta AWS com permissão para criar EC2, AMI, KeyPair, SecurityGroups e IAM (se você criar um usuário programático).
- AWS CLI instalado e configurado (`aws configure`) OU credenciais em variáveis de ambiente.
- Terraform v1.3+
- `ssh-keygen` disponível para criar chaves SSH (Linux/macOS/WSL/Windows Git Bash).


## ▶️ Criar chave SSH local (para conectar às instâncias)

ssh-keygen -t rsa -b 4096 -f ~/.ssh/terraform_demo -N ""

#### Isso gera:
#### ~/.ssh/terraform_demo (private)
#### ~/.ssh/terraform_demo.pub (public)

## ▶️ Exporte variáveis de ambiente AWS ou configure via `aws configure`

AWS Access Key ID [****************ABCD]: 

AWS Secret Access Key [****************iyny]: 

Default region name [us-east-1]:

Default output format [json]: 

## ▶️ Comandos Terraform para criar a infraestrura IaC

### Inicializar o projeto:

terraform init

### Validar o código:

terraform validate

### Ver o que será criado:

terraform plan

### Aplicar (criar toda a infraestrutura):

terraform apply

## ▶️ Resultado do terraform apply

Changes to Outputs:
  - custom_ami_id        = "ami-055c1afd498e7b962" -> null
  - from_ami_instance_id = "i-0b0bbda2f2b64d5f9" -> null
  - from_ami_public_ip   = "54.221.138.101" -> null
  - primary_instance_id  = "i-0ab411e6bf9241789" -> null
  - primary_public_ip    = "52.91.244.135" -> null

## ▶️ Git / GitHub: passos para subir projeto público

### ▶️ git init

### ▶️ git status

On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .gitignore
        README.md
        main.tf
        nginx-cloud-init.sh
        outputs.tf
        providers.tf
        userdata.sh

### ▶️ git add .

### ▶️ git status

On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   .gitignore
        new file:   README.md
        new file:   main.tf
        new file:   nginx-cloud-init.sh
        new file:   outputs.tf
        new file:   providers.tf
        new file:   userdata.sh
        new file:   variables.tf

### ▶️ git commit -m "Infra AWS Terraform EC2 + AMI + NGINX"

[main (root-commit) 2e90f12] Infra AWS Terraform EC2 + AMI + NGINX

 8 files changed, 379 insertions(+)

 create mode 100644 .gitignore

 create mode 100644 README.md

 create mode 100644 main.tf

 create mode 100644 nginx-cloud-init.sh

 create mode 100644 outputs.tf

 create mode 100644 providers.tf

 create mode 100644 userdata.sh

 create mode 100644 variables.tf

### ▶️ git branch -M main

### ▶️ git push -u origin main

Enumerating objects: 10, done.

Counting objects: 100% (10/10), done.

Delta compression using up to 12 threads

Compressing objects: 100% (10/10), done.

Writing objects: 100% (10/10), 4.22 KiB | 4.22 MiB/s, done.

Total 10 (delta 0), reused 0 (delta 0), pack-reused 0

To https://github.com/ademarbarreto/desafio-TQI-terraform-ec2-ami-nginx.git

 * [new branch]      main -> main

branch 'main' set up to track 'origin/main'.


## Passos rápidos
1. Gere uma chave SSH local: `ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""`
2. Exporte variáveis de ambiente AWS ou configure via `aws configure`.

## ▶️ Comandos Terraform para criar a infraestrura IaC

3. `terraform init`
4. `terraform plan`
5. `terraform apply`
6. Resultado do output após o terraform apply:



▶️ 7. Comandos Terraform para destruir ar a infraestrura IaC

6. `terraform destroy`


## Como a AMI é criada
▶️ 7. Comandos Terraform para criar a infraestrura IaC



