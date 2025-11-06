# ☕ Coffee Server

API REST em Go para gerenciamento de cafés. Sistema desenvolvido para controlar estoque e vendas de cafés especiais.

## 📋 Pré-requisitos

- Go 1.20+
- Docker
- Make
- PostgreSQL 17
- Go Migrate

## 🏗️ Tecnologias Utilizadass

- [Go](https://golang.org/) - Linguagem de programação
- [Gin](https://gin-gonic.com/) - Framework web
- [GORM](https://gorm.io/) - ORM para Go
- [PostgreSQL](https://www.postgresql.org/) - Banco de dados
- [Docker](https://www.docker.com/) - Containerização
- [Go Migrate](https://github.com/golang-migrate/migrate) - Migrações
- [JWT](https://jwt.io/) - Autenticação

## 🗄️ Estrutura do Banco de Dados

A aplicação utiliza PostgreSQL com as seguintes tabelas:

### Coffees

- `id` - UUID (chave primária)
- `name` - Nome do café
- `description` - Descrição detalhada
- `roast` - Tipo de torra (light, medium, dark)
- `region` - Região de origem
- `image` - URL da imagem
- `price` - Preço
- `stock` - Quantidade em estoque
- `grind_unit` - Unidade de moagem
- `created_at` - Data de criação
- `updated_at` - Data de atualização

### Users

- `id` - UUID (chave primária)
- `name` - Nome completo
- `email` - Email (único)
- `password` - Senha (hash)
- `role` - Função (admin/user)
- `created_at` - Data de criação
- `updated_at` - Data de atualização

## 🚀 Configuração do Ambiente

1. Clone o repositório

```bash
git clone https://github.com/JMustang/coffee-server.git
cd coffee-server
```

2. Crie um arquivo `.env` baseado no exemplo:

```env
DB_DOCKER_CONTAINER=coffee_db
DB_HOST=localhost
DB_PORT=5432
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_NAME=coffee_db
JWT_SECRET=seu_secret_jwt
API_PORT=8080
```

3. Execute os comandos para configurar:

```bash
make setup # Instala dependências
make start # Inicia containers e banco de dados
make migrate # Executa migrações
```

## 📡 Endpoints da API

### Autenticação

- `POST /api/v1/auth/login` - Login de usuário
- `POST /api/v1/auth/register` - Registro de novo usuário

### Cafés

- `GET /api/v1/coffees` - Lista todos os cafés
- `GET /api/v1/coffees/:id` - Busca café por ID
- `POST /api/v1/coffees` - Cria novo café
- `PUT /api/v1/coffees/:id` - Atualiza café
- `DELETE /api/v1/coffees/:id` - Remove café

## 🛠️ Comandos Make

- `make setup` - Configura ambiente de desenvolvimento
- `make start` - Inicia todos os serviços
- `make stop` - Para todos os serviços
- `make test` - Executa testes
- `make migrate` - Executa migrações pendentes
- `make migrate-down` - Reverte última migração
- `make create-migration name=migration_name` - Cria nova migração

## 🧪 Testes

Execute os testes com:

```bash
make test # Executa todos os testes
make test-coverage # Executa testes com cobertura
```

## 📦 Build e Deploy

Para build:

```bash
make build # Gera binário
```

Para deploy:

```bash
make deploy # Deploy em produção
```

## 🤝 Contribuindo

1. Fork o projeto
2. Crie sua branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
