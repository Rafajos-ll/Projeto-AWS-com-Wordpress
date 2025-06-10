## Criacao da EC2 e templates

1.Para criar nossa template EC2 iremos no painel e digitaremos na barra de busca:

![Texto Alternativo](/Imagens/EC2-criacao.png)

2.Criaremos a template agora clicando em modelos de execucao assim conseguimos subir instancias com configuracoes ja pre-definidas:

![Texto Alternativo](/Imagens/TEMPLATE-EC2.png)

3.Agora faremos a configuracao do nome e uma descricao:

![Texto Alternativo](/Imagens/criacao-nome-template.png)

4.Faremos aqui a selecao do nosso sistema operacional no nosso caso usaremos ubuntu:

![Texto Alternativo](/Imagens/template-OS.png)

5.faremos aqui a escolha do tipo de instancia,editar nosso proprio par de chaves e nossa configuracao de rede com o security group que criamos:

![Texto Alternativo](/Imagens/tipo-de-instancia.png)

6.Agora adicionado as tags e com tudo configurado botaremos as informacoes do user.data para fazer o processo automatico de configuracao do nosso OS:

```bash

#!/bin/bash

# Atualizações e instalações básicas
yum update -y
yum install -y aws-cli

# Instalação e configuração do Docker
yum install -y docker
service docker start
systemctl enable docker
usermod -a -G docker ec2-user

# Instalação do Docker Compose
curl -SL https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Instalação e montagem do EFS
yum install -y amazon-efs-utils
mkdir -p /mnt/efs
mount -t efs fs-0e9c6a9baee3bfe28:/ /mnt/efs
echo "fs-0e9c6a9baee3bfe28:/ /mnt/efs efs defaults,_netdev 0 0" >> /etc/fstab

# Permissões corretas para WordPress (usuário 33 = www-data)
chown -R 33:33 /mnt/efs

# Preparação do projeto
mkdir -p /home/ec2-user/projeto-docker
cd /home/ec2-user/projeto-docker

# docker-compose.yml
cat > docker-compose.yml <<EOL
version: '3.7'
services:
  wordpress:
    image: wordpress:latest
    container_name: wordpress
    environment:
      WORDPRESS_DB_HOST: seu-db-host
      WORDPRESS_DB_NAME: db-name
      WORDPRESS_DB_USER: seu-user
      WORDPRESS_DB_PASSWORD:sua-senha
    ports:
      - 80:80
    volumes:
      - /mnt/efs:/var/www/html
EOL

# Inicia o container com o ec2-user
sudo -u ec2-user docker-compose up -d

```
