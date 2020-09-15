# O que é o Gateway de Aplicativo do Azure?


O Gateway de Aplicativo do Azure é um balanceador de carga do tráfego da Web que permite que você gerencie o tráfego para seus aplicativos Web. Os balanceadores de carga tradicionais operam na camada de transporte (camada OSI 4 – TCP e UDP) e encaminham o tráfego com base no endereço IP de origem e na porta para um endereço IP de destino e uma porta.

O Gateway de Aplicativo pode tomar decisões de roteiros com base em outros atributos de uma solicitação HTTP, por exemplo, o caminho de URI ou os cabeçalhos de host. Por exemplo, você pode encaminhar o tráfego com base na URL de entrada. Portanto, se /images estiver na URL de entrada, você poderá encaminhar o tráfego para um conjunto específico de servidores (conhecido como um pool) configurado para as imagens. Se /video estiver na URL, esse tráfego será encaminhado para outro pool otimizado para vídeos.

![Application-Gateway](/imagens/AG.png)


Esse tipo de roteamento é conhecido como balanceamento de carga da camada de aplicativo (camada OSI 7). O Gateway de Aplicativo do Azure pode fazer o roteamento baseado em URL e muito mais.


## Recursos
Para saber mais sobre os recursos do Gateway de Aplicativo, confira Recursos do  [`Gateway de Aplicativo do Azure`](https://docs.microsoft.com/pt-br/azure/application-gateway/features).

