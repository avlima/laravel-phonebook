#Sobre os requisitos pedidos:

Implemente uma agenda telefônica que atenda aos seguintes requisitos técnicos e de negócios:

- Use PHP puro, jQuery e Bootstrap (OK)
  - Utilizei o laravel 5.4 pois conforme contato via Skype poderia usar um Framework.
  - Publiquei um projeto antigo de PHP puro em MVC com DI, caso queiram dar uma olhada: https://github.com/avlima/php-mvc-nonframework
  - Por conta do meu emprego atual não tive muito tempo para estruturar algo bacana em PHP puro, mas o exemplo está logo acima.

- Use a arquitetura MVC e Rest (OK)
  - Eu costumo estruturar diferente o MVC do Laravel, eu Guardo os diretórios de Controller, Services, Models, Providers, Contratcs tudo dentro de um Objeto. Assim cada Objeto tem seu módulo fechado e mais organizado.
  - No teste por ser uma aplicação pequena eu mantive o padrão do Laravel e criei outras estruturas com Services, Models, Contracts, Utils, Enum, etc...
  - Deixei a aplicação híbrida para vocês poderem ver na prática tanto REST quando FORM, criei esse método apenas para o Objeto Contato pois no tempo que tinha era curto. Mas tem tem um controller híbrido bem bacana.

- O site deve ser responsivo (OK)
  - Está todo responsivo (Utilizando o próprio bootstrap, não fiz nada customizado)

- A agenda deve possuir telas de cadastro e CRUD de contatos (OK)
  - Tanto a Agenda quanto Contato possuem CRUD, com métodos organizados pelo padrão REST
  
- Os campos devem possuir máscara de validação de dados no front e back (OK)
  - Os formulário estão com máscaras nos campos devidos e a validação eu optei por fazer apenas no back-end para que você possam ver na prática, se tivesse validação no front-end não teriam como testar o back.

- Crie uma área administrativa com dashboard e gráficos que considerar pertinentes a um administrador do negócio. Considere os seguintes dados: Nome, telefone e e-mail.
  - Na verdade ficou mesmo um Admin de forma simples mas com padrões bem robustos e organizados.
  - O gráfico do dashborad apesar de ser simples, ele traz dados reais
  

#Diferenciais:
- Layout responsivo para celular e desktop
  - (Concluído)
  
- Backend sobre API Rest
  - (Concluído e de forma hibrida)
  
- Validação de dados no front e no backend
  - (Concluído)
  
- Conhecimentos básicos de configuração de servidor
  - (Tenho muito conhecimento em Servidor, AWS EC2, RDS, S3 e conheço de linux pois eu configuro todos os nossos ambientes)

- Testes unitários - Testes E2E
  - (Conheço mas não apliquei no teste pois volto a dizer, o tempo que tive me dediquei pra fazer uma aplicação bacana e não pude fazer testes com PHPUnit)
  
#Dica para testarem a palicação
- Após instalarem o projeto, rodarem o arquivo sql no banco e instalarem o passport. No banco tem dois usuarios (Senha: 123456) e ambos com meus e-mails, alterem para um e-mail válido de voces pois a parte de recuperação de senha do login da agenda está funcionando e enviando e-mail.
- Apénas o usuario de ID 1 está com acesso para fazer requisições API com password credentials. (Então sugiro que aproveitem os cadastro inseridos e alterem apenas o e-mail)

#Um pouco da construção do projeto (importante)
Laravel 5.4 + Passport + Auth + Hybrid Controller REST and FORM + Single database multi-tenancy
- Foi utilizado (Single database multi-tenancy) como podemos ter varios usuarios, um não podem ver o registro do outro. Eu implementei um forma onde não precise ficar toda hora fazendo where filtrando pelo id do usuário. Voce vai ver que em nenhum momento eu filtro pelo id do usuario, isso ficou transparente pra quem for programar e ainda sim ele trata todas as requisição de banco inclusive inserts.
- Foi implementado Interface como forma de contrato para ninguem chamar um método que não exista de fato dentro do serviço.
- Providers obrigando a construção de serviço atraves das Interfaces, obrigando o programador não errar.
- No Model de Contato reparem que tem um evento deleting. Ele é responsavel por verificar automaticamente se meu objeto tem relacionamento antes de tentar excluir.
- Caso de erro ao excluir um Contato por ter relacionamento com a Agenda, o serviço está preparado pra responder de forma customizada tanto o FORM quanto a API.
- Passport é o padrão OAuth2 do Laravel para autenticar requisição API.

#Obrigado
Alberto Vieira de Lima
GitHub: avlima

