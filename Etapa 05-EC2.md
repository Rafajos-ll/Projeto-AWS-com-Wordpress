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
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

sudo apt-get update
sudo apt-get -y install git binutils rustc cargo pkg-config libssl-dev
git clone https://github.com/aws/efs-utils
cd efs-utils
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb

sudo mkdir -p /mnt/efs
sudo mount -t efs -o tls fs-0e393bc2c3d3fc5be:/ /mnt/efs

cd /home/ubuntu

cat > docker-compose.yml <<EOL

version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    container_name: {name}
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: {host}
      WORDPRESS_DB_USER: {user}
      WORDPRESS_DB_PASSWORD: {senha}
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - /mnt/efs:/var/www/html

EOL

sudo docker compose up -d
```
