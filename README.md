# Roleta MBL
A classe de Roleta é flexível por meio do RouletteResource, que é responsável por carregar o conteúdo em destaque. O ciclo de funcionamento dela é simples: ela carrega os recursos no initState() de forma assíncrona, por meio de preload. Ela também possui um timer interno, que, a cada 10 segundos, passa automaticamente para o próximo recurso.

Se o usuário colocar o mouse sobre o item ou clicar nele, a imagem é sobreposta por uma interface interativa, que fornece mais detalhes sobre o objeto. Como a interface é 100% personalizável, podem ser adicionados sistemas para redirecionar o usuário dentro dessa interface.

Navegação da documentação:

- [CapsuleAudio](#capsuleaudio)
- [CapsuleVideo](#capsulevideo)
- [Roulette](#roulette)
- [RouletteResource](#rouletteresource)

## Cápsula
> As cápsulas são classes/interfaces que fazem uma ponte segura entre o projeto e uma biblioteca externa.

> **Aviso: Na implementação de demonstração, não há bibliotecas de vídeo e áudio, pois não sei qual projeto usa. O sistema apenas imprime o que deveria acontecer. Por exemplo, quando a roleta passa, ele imprime: "Efeito Sonoro de Troca".**

### CapsuleAudio
[.dart](lib/Roulette/Capsule/CapsuleAudio.dart)
**preload()**

Essa função é chamada no initState() da roleta. Ela pode ser usada para carregar arquivos antes de serem reproduzidos.

**play()**

Essa função é chamada toda vez que a página é trocada.

### CapsuleVideo
[.dart](lib/Roulette/Capsule/CapsuleVideo.dart)
**preload()**

Essa função é chamada no initState() da roleta. Ela pode ser usada para carregar arquivos de vídeo.

**build()**

Essa função é chamada 5 segundos após o objeto estar visível. Ela renderiza o elemento de vídeo, que vai substituir a imagem.

## Componente
### Roulette
[.dart](lib/Roulette/Roulette.dart)
Esse é o componente principal do projeto. Ele renderiza e administra os RouletteResources.

Variáveis:

> **double height**
Valor que define a altura fixa da roleta.

> **Color background**
Valor que define a cor padrão do fundo da roleta.

> **Icon frontButtonIcon**
Widget de ícone que define o ícone do botão que avança para o próximo destaque.

> **Icon backButtonIcon**
Widget de ícone que define o ícone do botão que retorna ao destaque anterior.

> **ButtonStyle buttonStyle**
Classe que define o estilo dos botões de navegação.

> **CapsuleAudio audio**
Classe que gerencia o áudio que será tocado ao mudar de página.

> **List<[RouletteResource](#rouletteresource)> children**
Lista de páginas que serão exibidas no destaque.

### RouletteResource
[.dart](lib/Roulette/RouletteResource.dart)
> **Widget details**
É a janela interativa que é revelada quando o mouse passa sobre a interface ou quando o objeto é clicado. Ela pode revelar detalhes personalizados sobre o item em destaque.

> **Image videoThumbnail**
Capa do vídeo que fica visível por 3 segundos enquanto o vídeo é carregado em segundo plano.

> **CapsuleVideo videoContent**
Vídeo curto renderizado de demonstração do conteúdo.