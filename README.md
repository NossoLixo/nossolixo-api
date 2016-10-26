# Nosso Lixo API

[![Build Status](https://travis-ci.org/NossoLixo/nossolixo-api.svg?branch=master)](https://travis-ci.org/NossoLixo/nossolixo-api)

## Getting start

- Clone the repository
- Run the setup `$ bin/setup`
- Start the project `$ bin/rails s`

## Routes

### User

1- Create User

`POST /auth`

Request

```json
{
  "name": "Thiago Guimarães",
  "email": "thiagogsr@gmail.com",
  "password": "12345678",
  "password_confirmation": "12345678"
}
```

Response

```json
{
  "status": "success",
  "data": {
    "id": "fb5c9954-440a-408f-a66c-5adf4f221629",
    "email": "thiagogsr@gmail.com",
    "provider": "email",
    "uid": "thiagogsr@gmail.com",
    "name": "Thiago Guimarães",
    "created_at": "2016-10-26T02:55:26.318Z",
    "updated_at": "2016-10-26T02:55:26.488Z",
    "role": "guest"
  }
}
```

Response headers

```
access-token 8PiTPmN08b9BRqsKE9xcbA
client b3JqwdNx0i9k-L9IdobSAw
expiry 1478660126
token-type Bearer
uid thiagogsr@gmail.com
```

Store to send them as request headers in all authenticated requests.

2- Update User

`PUT /auth`

Requires authentication.

Request

```json
{
  "name": "Thiago Guimarães Santa Rosa"
}
```

Response

```json
{
  "status": "success",
  "data": {
    "id": "fb5c9954-440a-408f-a66c-5adf4f221629",
    "name": "Thiago Guimarães Santa Rosa",
    "email": "thiagogsr@gmail.com",
    "provider": "email",
    "uid": "thiagogsr@gmail.com",
    "created_at": "2016-10-26T02:55:26.318Z",
    "updated_at": "2016-10-26T02:58:57.751Z",
    "role": "guest"
  }
}
```

3- Sign In

`POST /auth/sign_in`

Request

```json
{
  "email": "thiagogsr@gmail.com",
  "password": "12345678"
}
```

Response

```json
{
  "data": {
    "id": "fb5c9954-440a-408f-a66c-5adf4f221629",
    "email": "thiagogsr@gmail.com",
    "provider": "email",
    "uid": "thiagogsr@gmail.com",
    "name": "Thiago Guimarães Santa Rosa",
    "role": "guest"
  }
}
```

Error response

```json
{
  "errors": [
    "Invalid login credentials. Please try again."
  ]
}
```

### Category

Requires authentication.

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
    "color": "#fefefe",
    "approved": false
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
    "color": "#fefefe",
    "approved": true
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
      "color": "#fefefe",
      "approved": true
    }
  ]
}
```
