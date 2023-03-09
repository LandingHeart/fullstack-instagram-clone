# API Endpoints:

- **User**
- **Post**

Base url:

`Development:` http://localhost:8080/api/(endpoint)

`Production:` https://fullstack-instagram-clone.herokuapp.com/api/

## User Endpoint:

#### Create

POST /api/user/register

`Params:` None

`Request Body`: {**email**: String, **password**: String, **username**: String, **phone(optional)**: Int}

Example:
```JSON
{
    "email": "123@456.com",
    "password": "abcd",
    "username": "Kelly"
}
```

`🟢Success case: ` Status code: 201

```JSON
{
  "id": 6,
  "email": "123@456.com",
  "password": "$2b$10$MIBnjS6Jd4ht.7unbMgfFekSxyjHFwP1MdnFvqBjq8BX6NBZhzhPK",
  "username": "Kelly",
  "updatedAt": "2023-03-09T17:55:40.356Z",
  "createdAt": "2023-03-09T17:55:40.356Z",
  "phone": null,
  "last_edit_date": null
}
```

`🔴Failed case: ` Status code: 409

```JSON
{
    "error": "user exist"
}

```

#### Read

#### Update

#### Delete

## Post Endpoint:

#### Create

#### Read

#### Update

#### Delete
