## Criacao do Auto-scaling group

1. Vamos criar nosso auto scalling group:

![Texto alternativo](/Imagens/Autoscalingcriar.png)

![Texto alternativo](/Imagens/autoscalingcriar2.png)

2.selecionaremos o nome agora e nossa instancia:

![Texto alternativo](/Imagens/AutoscallingTemplate.png)

3. agora adicionaremos nossa vpc, junto tambem de nossas subnets privadas e na opcao equilibrada:

![Texto alternativo](/Imagens/configVPCautoscalling.png)

4. agora vamos anexa-la ao nosso load balancer criado na secao anterior:

![Texto alternativo](/Imagens/AutoscallingBalanceamento.png)

5. agora configuremos a capacidade desejada para nossas instancias:

![Texto alternativo](/Imagens/TamanhodoAutoScalling.png)

6. agora com auto-scalling criado nossa aplicacao sera re lancada mesmo caso fique fora do ar:

![Texto alternativo](/Imagens/autoscallingCriado.png)

