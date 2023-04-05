# API de Filmes

  Essa é uma API RESTful para consultar e filtrar informações de filmes. Os dados são armazenados em um banco de dados SQLite e podem ser atualizados por meio de um arquivo CSV.

## Endpoints

  Listar todos os filmes
  Retorna uma lista com todos os filmes cadastrados.
  ```GET /movies```

## Parâmetros de filtro opcionais:

  genre - Filtra os filmes por gênero.
  country - Filtra os filmes por país.
  year - Filtra os filmes por ano de lançamento.

  ### Exemplo de resposta:

    ```
      [
        {
          "id": 1,
          "title": "The Shawshank Redemption",
          "description": "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
          "year": 1994,
          "genre": "Drama",
          "country": "United States",
          "published_at": "2022-04-03T20:47:06.112Z"
        },
        {
          "id": 2,
          "title": "The Godfather",
          "description": "An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.",
          "year": 1972,
          "genre": "Crime",
          "country": "United States",
          "published_at": "2022-04-03T20:47:06.112Z"
        }
      ]
    ```

## Atualizar filmes por arquivo CSV

  ### Atualiza o banco de dados com informações de filmes a partir de um arquivo CSV.

    ```POST /movies/update_csv```

  ### O arquivo CSV deve seguir o seguinte formato:

    title,description,year,genre,country
    The Shawshank Redemption,Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.,1994,Drama,United States
    The Godfather,An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.,1972,Crime,United States

  ### Exemplo de resposta:

    ```
      {
        "message": "CSV importado com sucesso"
      }
    ```

# Tecnologias
  Ruby 3.0.0
  Rails 6.1.3
  SQLite 3

# Instalação

  ## Clone este repositório:

    ```git clone https://github.com/seu-usuario/nome-do-repositorio.git```

  ## Instale as dependências:

    ```bundle install```

  ## Crie o banco de dados:

    ```rails db:create```

  ## Execute as migrações:

    ```rails db:migrate```

  ## Execute os testes:

    ```bundle exec rspec```
