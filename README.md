# :book: MyManga

Repaginação do meu primeiro projeto em Flutter! 

## :robot: V1

A V1, criada no começo de 2022, foi a primeira vez que criei um projeto Flutter. A ideia dele era construir algo parecido com o LetterBoxd, só que para mangás e, por enquanto, sem a interação entre usuários. Pra isso, eu fui seguindo um guia pelo youtube (do canal DotCode) e fui aprendendo um pouco do uso de Providers e tive o contato inicial com o Firebase. Não cheguei a desenvolver nenhum teste, que só fui descobrir que existia no meu primeiro mês de trabalho haha.

Era essa aqui a carinha dele na época: 

## :sparkles: O que temos agora

Nessa versão atual, estou aplicando o conhecimento que adquiri atuando como Dev no último ano (de 2022 até agora em 2023). Como MVP, as principais rotas criadas são a Home, a página de adicionar novos mangás, a página de informações detalhadas de cada manga (com uma listagem dos capítulos).

Para navegação, controle de estado e injeção de dependências, estou usando a biblioteca Getx.

## Estrutura de pastas

```
.
├── assets/ #Imagens, icones e arquivos estáticos
├── lib/ #Todo o código do módulo
│   ├── bindings/ #Bindigs do GetX 
│   ├── components/ #Widgets genéricos e reutilizáveis
│   ├── constants/ #Textos e mensagens
│   ├── controllers/ # Controllers a serem utilizadas em GetX
│   ├── models/ #Estruturas de dados do sistema
│   ├── theme/ #Tema do app, cores, fonte, tamanhos
│   ├── utils/ #Classes e métodos de auxílio. Formatters, etc
│   └── views/ #Telas. No Flutter telas, componentes e tudo mais são widgets
└── test/ #Todos os testes, seguindo a mesma estrutura da lib
```
 
## :construction: O que falta

Algumas features do que pretendo adicionar: 

  - Alterar a splashscreen atual, passando elas pro nativo, usando a flutter_splash_native.

  - Criar icon para o launcher do app, com flutter_launch_icons

  - Features de:
    - exclusão de mangas
    - avaliação entre 1 a 5 estrelas
    - Webview para leitura de capitulos com Url cadastrada

  - Conectar o app a um projeto Firebase, para poder usar o FireCloud para armazenar e consumir dados, visto que ainda não tenho um backend e banco desenvolvidos

  - Criar services para puxar os dados do Firebase

  - Criar um login e armazenar a info do usuário para buscar seus mangás cadastrados no Firebase. Usar a biblioteca Shared_Preferences para manter essas infos disponíveis.

## Melhorias a fazer
  - Criar getters e setters para as variavéis das controllers, assim tornar o código mais seguro e menos verboso (principalmente para as variáveis observáveis)
  - Melhorar a aparência de widgets
  - Componentizar melhor os widgets (por exemplo, criar um widget único de checkbox, que aceita título e ação, assim não preciso dos dois componentes diferentes mas iguais da addmanga)
