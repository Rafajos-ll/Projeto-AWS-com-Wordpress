## Criaçao do nosso EFS

1. Va na barra de pesquisar e digite por EFS:

![Texto Alternativo](/Imagens/Efs%20explique.png)

2.Uma vez dentro do EFS clicaremos no botao de criar sistemas de arquivos no canto superior direito:

![Texto Alternativo](/Imagens/EFS%20criacao.png)

3.Um pop-up aparece-ra indique um nome pro nosso EFS e nao esqueca de colocar a vpc que criamos anteriormente,em seguida clique em personalizar

![Texto Alternativo](/Imagens/Criacao%20do%20EFS.png)

4.aqui vamos personalizar nosso EFS com as seguintes configs:

![Texto Alternativo](/Imagens/EFS%20personalizado2.png)

![Texto Alternativo](/Imagens/EFS%20PERSONALIZADO.png)

5.Agora com ela configurada chegamos na parte de rede e faremos os ajustes para incluir nossa VPC criada anteriormente assim como o SG do EFS e tambem o id da subnet privada da nossa VPC:

![Texto Alternativo](/Imagens/EFS-rede.png)

6.Na proxima janela que abrir so de proximo:

![Texto Alternativo](/Imagens/Screenshot_1.png)

7.Com nossa EFS criada lembre-se de guardar o ID pos precisaremos dele para o script de inicializacao do user.data da instancia EC2 :

![Texto Alternativo](/Imagens/EFS%20criada.png)

