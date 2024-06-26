
### Especificações - TESTE MOBILE.

1. Criar um app que carregue dados do seguinte Json: https://wswork.com.br/cars.json
2. O app deve conter uma listagem de carros que venha do JSON acima.
3. O app deve permitir que o usuário selecione um carro e aperte um botão EU
   QUERO, após pressionar o botão “Eu quero”, esse registro de compra (lead) é salvo
   no banco sqlite interno com os dados do usuário que decidiu comprar (você
   precisará identificar esse usuário), seja com telefone, email, etc - use sua
   criatividade.
4. Deve haver uma rotina que de tempos em tempos fará post dos leads em
   https://www.wswork.com.br/cars/leads você pode usar o formato que preferir, não se
   preocupe, qualquer requisição que for enviada para esta URL a gente vai conseguir
   detectar.
5. Envie para nós uma explicação a respeito de suas decisões técnicas dentro do
   projeto.

### Pacotes Utilizados

- http: Cliente HTTP para consumir APIs.
- isar: Banco de dados No-SQL de de alta performance.
- isar_flutter_libs: Habilita a visualização do Isar, no terminal acesse o link 
e veja os dados em tempo real.
- intl: Manipulacão para manipulação de valores monetários.
- go_router: Gerenciamento de rotas muito eficiente e completo.
- mobx e mobx_flutter: Gerenciamento de estado com fluxo reativo.
- path_provider: Acesso a caminhos usuais do sistema de arquivos.

### Decisões Técnicas

O app traz como desafio carregar os dados em uma rotina de sincronização, para isso 
adicionei o Isar para cadastrar o usuario e o interesse do usuario em um carro.

No processo de sincronização adicionei um loop de repetição simples (while), mas em casos mais 
avançados poderia-se usar a observação em um fluxo de dados (Stream) pelo Isar, e a cada alteração
poderia se enviar para o servidor, já que oferece esse recurso.

A biblioteca GoRouter facilita o controle de rotas com os redirecionamentos, e mobx pela 
simplicidade e ao mesmo tempo certa organização de pastas (estilo MVVM).

Por fim, fiz um teste de unidade para o repositorio.