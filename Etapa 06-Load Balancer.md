## Criacao do Load Balancer

1. Para mantermos nossa aplicacao saudavel e com alta disponibilidade caso ocorra falhas iremos agora configurar o load balancer, primeiro procure por load balancer na barra de busca:

![Texto Alternativo](/Imagens/ProcuraLB.png)

2.Agora iremos criar nosso LB, clique no botao criar load balancer no canto superior direito:

![Texto Alternativo](/Imagens/criarLB.png)

3.Agora vamos escolher nosso tipo de load balancer clicando em classic load balancer vamos usar esta opcao:

![Texto Alternativo](/Imagens/TIposDeLB.png)

![Texto Alternativo](/Imagens/ClassicLB.png)

4.Colocaremos um nome agora pro nosso LB, fica o nome que preferir:

![Texto Alternativo](/Imagens/LbName.png)

5.Aqui colocaremos nossa VPC criada para o projeto e suas subnets PUBLICAS para ter o acesso e trafego pela internet:

![Texto Alternativo](/Imagens/ZonasEVPC.png)

6.Vamos agora configurar o security group que criamos para o LB e as portas 80 para acesso:

![Texto Alternativo](/Imagens/LB-security-e-Listeners.png)

7.Configuramos agora a integridade do nosso servico como o ping e o caminho dele assim como configuracoes personalizadas de verificacao:

![Texto Alternativo](/Imagens/VerificaoDeIntegridadeLB.png)

8.Agora com tudo configurado podemos criar nosso Load Balancer:

![Texto Alternativo](/Imagens/FINALLB.png)

