# Nosso Lixo API

[![Build Status](https://travis-ci.org/NossoLixo/nossolixo-api.svg?branch=master)](https://travis-ci.org/NossoLixo/nossolixo-api)
[![Code Climate](https://codeclimate.com/github/NossoLixo/nossolixo-api/badges/gpa.svg)](https://codeclimate.com/github/NossoLixo/nossolixo-api)

## Getting start

- Clone the repository
- Run the setup `$ bin/setup`
- Start the project `$ bin/rails s`

## Routes

### User

1- Create user

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

2- Update user (requires authentication)

`PUT /auth`

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

3- Sign-in

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

1- Create category (requires authentication)

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

2- Approve category (requires authentication)

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

3- List categories (requires authentication)

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

### City

1- List cities

`GET /v1/cities`

Response

```json
{
  "status": "success",
  "data": [
    {
      "name": "Aracaju",
      "state": "SE"
    }
  ]
}
```

### Place

1- Create place (requires authentication)

`POST /v1/places`

Request

```json
{
  "city_id": "a60edc85-28db-419d-b412-99f897815c1d",
  "name": "CARE",
  "description": "Cooperativa dos Agentes Autônomos de Reciclagem de Aracaju",
  "street": "R. A5",
  "number": "15",
  "district": "Santa Maria",
  "lat": -10.9919196,
  "lng": -37.0984939,
  "phone_number": "7932431581",
  "email": "",
  "site": ""
}
```

Response

```json
{
  "status": "success",
  "data": {
    "id": "c6689b31-4cb0-47f1-95b5-32b74e19e62c",
    "name": "CARE",
    "description": "Cooperativa dos Agentes Autônomos de Reciclagem de Aracaju",
    "street": "R. A5",
    "number": "15",
    "district": "Santa Maria",
    "lat": "-10.9919196",
    "lng": "-37.0984939",
    "phone_number": "7932431581",
    "email": null,
    "site": null,
    "approved": true,
    "city": {
      "id": "a60edc85-28db-419d-b412-99f897815c1d",
      "name": "Aracaju",
      "state": "SE"
    },
    "categories": []
  }
}
```

2- Approve place (requires authentication)

`PUT /v1/places/:place_id`

Response

```json
{
  "status": "success",
  "data": {
    "id": "c6689b31-4cb0-47f1-95b5-32b74e19e62c",
    "name": "CARE",
    "description": "Cooperativa dos Agentes Autônomos de Reciclagem de Aracaju",
    "street": "R. A5",
    "number": "15",
    "district": "Santa Maria",
    "lat": "-10.9919196",
    "lng": "-37.0984939",
    "phone_number": "7932431581",
    "email": null,
    "site": null,
    "approved": true,
    "city": {
      "id": "a60edc85-28db-419d-b412-99f897815c1d",
      "name": "Aracaju",
      "state": "SE"
    },
    "categories": []
  }
}
```

3- List places

`GET /v1/places`

Response

```json
{
  "status": "success",
  "data": [
    {
      "id": "c6689b31-4cb0-47f1-95b5-32b74e19e62c",
      "name": "CARE",
      "description": "Cooperativa dos Agentes Autônomos de Reciclagem de Aracaju",
      "street": "R. A5",
      "number": "15",
      "district": "Santa Maria",
      "lat": "-10.9919196",
      "lng": "-37.0984939",
      "phone_number": "7932431581",
      "email": null,
      "site": null,
      "approved": true,
      "city": {
        "id": "a60edc85-28db-419d-b412-99f897815c1d",
        "name": "Aracaju",
        "state": "SE"
      },
      "categories": [
        {
          "id": "ea80a68d-c915-482a-bca1-36b4acac6f15",
          "name": "Plástico",
          "color": "#ffffff"
        },
        {
          "id": "40ca86f5-58ad-4c3a-9617-da2f730f7164",
          "name": "Metal",
          "color": "#000000"
        }
      ]
    }
  ]
}
```
