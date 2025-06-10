## Criaremos security groups para nossos serviços, assim garantindo a segurança dos mesmos

1.No canto superior direito clique em criar grupo de segurança:

![Texto Alternativo](/Imagens/Screenshot_7.png)

2.Criamos o security  group da nossa instancia EC2:

![Texto Alternativo](/Imagens/Screenshot_8.png)

3.Criaremos o Security group do nosso banco de dados:

![Texto Alternativo](/Imagens/SG%20bd.png)

4.Criaremos o Security Group do nosso (EFS):

![Texto Alternativo](/Imagens/EFS%20sg.png)

5.Criaremos o security group do nosso Load balancer:

![Texto Alternativo](/Imagens/LB-Security%20GROUP.png)

6.Com os security groups criados vamos dar regras agora para eles, segue abaixo as regras de entrada e saida do nosso EC2:

![Texto Alternativo](/Imagens/RegrasdeentradaEC2.png)

![Texto Alternativo](/Imagens/OutboundrulesEC2.png)

7.Segue abaixo as regras de entrada e saida do nosso RDS:

![Texto Alternativo](/Imagens/InbounndRulesRDS.png)

![Texto Alternativo](/Imagens/OutboundRulesEFS.png)

8.Segue abaixo as regras de entrada e saida do nosso EFS:

![Texto Alternativo](/Imagens/InboundRulesEFS.png)

![Texto Alternativo](/Imagens/OutboundRulesEFS.png)

9.E agora as regras de entrada e saida do nosso LB:

![Texto Alternativo](/Imagens/InboundRulesLB.png)

![Texto Alternativo](/Imagens/OutboundrulesLB.png)

