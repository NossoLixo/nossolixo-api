# Nosso Lixo API

## Getting start

- Clone the repository
- Run the setup `$ bin/setup`
- Start the project `$ bin/rails s`

## Routes

### Category

1- Create Category

`POST /v1/categories`

Request

```json
{
  "name": "Metal",
  "color": "#fefefe"
}
```

Response

```json
{
  "status": "success",
  "data": {
    "id": "a1e989b1-9d8a-4fd7-b0f6-e1fd0d36645f",
    "name": "Metal",
    "color": "#fefefe"
  }
}
```

Error response

```json
{
  "status": "error",
  "errors": {
    "color": [
      "has already been taken"
    ]
  }
}
```

2- Approve Category

`PUT /v1/categories/:category_id`

Response

```json
{
  "status": "success",
  "data": {
    "id": "a1e989b1-9d8a-4fd7-b0f6-e1fd0d36645f",
    "name": "Metal",
    "color": "#fefefe"
  }
}
```

3- List categories

`GET /v1/categories`

Response

```json
{
  "status": "success",
  "data": [
    {
      "id": "7d495710-4d8c-4091-bda6-56083fcaac27",
      "name": "Metal",
      "color": "#fefefe"
    }
  ]
}
```
