# Coffee Server

API REST em Go para gerenciamento de cafés.

## 📋 Pré-requisitos

- Go 1.20+
- Docker
- Make
- PostgreSQL 17

## 🗄️ Estrutura do Banco de Dados

A aplicação utiliza PostgreSQL com a seguinte estrutura:

- **coffees**: Tabela principal para armazenamento dos cafés
  - `id` - UUID (chave primária)
  - `name` - Nome do café
  - `roast` - Tipo de torra
  - `region` - Região de origem
  - `image` - URL da imagem
  - `price` - Preço
  - `grind_unit` - Unidade de moagem
  - `created_at` - Data de criação
  - `updated_at` - Data de atualização

## 🚀 Configuração do Ambiente

1. Clone o repositório
2. Crie um arquivo `.env` baseado no exemplo abaixo:

```env
DB_DOCKER_CONTAINER=coffee_db
USER=seu_usuario
PASSWORD=sua_senha
DB_NAME=coffee_db
```

3. Execute os comandos para configurar o banco de dados:

```bash
# Para o container existente (se houver)
make stop_containers

# Cria novo container
make create_container

# Cria o banco de dados
make create_db
```

## 🛠️ Comandos Disponíveis

- `make stop_containers` - Para todos os containers Docker em execução
- `make create_container` - Cria container do PostgreSQL
- `make create_db` - Cria banco de dados
- `make start_container` - Inicia o container
- `make stop_container` - Para o container
- `make remove_container` - Remove o container
- `make create_migration` - Cria nova migração

## 🔄 Migrações

As migrações do banco de dados estão localizadas no diretório `migrations/`. Use o comando `make create_migration` para criar novas migrações quando necessário.

## 📝 Licença

Este projeto está sob a licença MIT.
