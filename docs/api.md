# API Endpoints:

- **User**
- **Post**

Base url:

`Development:` http://localhost:8080/api/(endpoint)

`Production:` https://fullstack-instagram-clone.herokuapp.com/api/

## User Endpoint:

### Create

`Description:` Register for new user

`route:` POST /api/user/register

`Params:` None

`Request Body:` {**email**: String, **password**: String, **username**: String, **phone(optional)**: Int}

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

`🔴Failed case: `

Status code: 409

```JSON
{
    "error": "user exist"
}
```

<hr>

`Description:` renew access token using refresh token

`route:` Post /api/user/token

`Params:` None

`Request Body:` {**refreshToken**: String, **user**: { **email**: String, **password**: String} }

Example:

```JSON
{
    "refreshToken": "refreshToken",
    "user": {
        "email": "888",
        "password": "888"
    }
}
```

`🟢Success case: ` Status code: 200

```JSON
{
    "accessToken": "fjdajfoadj....."
}
```

`🔴Failed case: `

Status code: 403

```JSON
{
    "error": "Invalid Token"
}
```

### Login

`Description:` Login for one user

`route:` POST /api/user/login

`Params:` None

`Request Body:` {**email**: String, **password**: String}

Example:

```JSON
{
    "email": "123@456.com",
    "password": "abcd",
}
```

`🟢Success case: ` Status code: 200

```JSON
{
    "id": 6,
    "email": "123@456.com",
    "phone": null,
    "username": "Kelly",
    "password": "$2b$10$FH2pbTljKLzaKj/QmTMks.ZQwNPTPH5e1KUCCv0eVqrHlJJGjz50u",
    "last_edit_date": null,
    "createdAt": "2023-03-10T01:31:51.211Z",
    "updatedAt": "2023-03-10T01:31:51.211Z",
    "accessToken": "eyJ.....",
    "refreshToken": "efjz....."
}
```

`🔴Failed case: `

Status code: 401

```JSON
{
    "error": "user not found"
}
```

Status code: 403

```JSON
{
    "error": "incorrect password"
}
```

### Read

### Update

`Description:` update user's phone number

`route:` PATCH /api/user/login

`Params:` None

`Request Header:` {**Authorization**: Bearer \space (user's access token)}

`Request Body:` {**id**: Int, **phone**: Int}

Example:

```JSON
{
    "id": 6,
    "phone": 123456789
}
```

`🟢Success case: ` Status code: 200

```JSON
{
    "id": 6,
    "email": "123@456.com",
    "phone": 123456789,
    "username": "Kelly",
    "password": "$2b$10$FH2pbTljKLzaKj/QmTMks.ZQwNPTPH5e1KUCCv0eVqrHlJJGjz50u",
    "last_edit_date": null,
    "createdAt": "2023-03-10T01:31:51.211Z",
    "updatedAt": "2023-03-10T03:14:14.654Z"
}
```

`🔴Failed case: `

### Delete

## Post Endpoint:

### Create

### Read

### Update

### Delete
