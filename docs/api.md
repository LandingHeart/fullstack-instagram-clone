# API Endpoints:

- **User**
- **Post**

Base url:

`Development:` http://localhost:8080/api/(endpoint)

`Production:` https://fullstack-instagram-clone.herokuapp.com/api/

## User Endpoint:

### Register

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

### Renew Token

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

<hr>

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

<hr>

### Logout

`Description:` Logout for one user

`route:` DELETE /api/user/login

`Params:` None

`Request Body:` {**token**: String}

Example:

```JSON
{
    "token": "eyJhbGciOi......UE"
}
```

`🟢Success case: ` Status code: 204

`🔴Failed case: `

Status code: 400

```JSON
{
    "status": 400,
    "message": "token not found"
}
```

<hr>

### Update Phone Number

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

## Post Endpoint:

### All Post

`Description:` Get all posts

`route:` GET /api/post

`Params:` None

`Request Body:` None

`🟢Success case: ` Status code: 200

```JSON
[
  {
    "id": 1,
    "title": "title",
    "postImgUrl": "image url",
    "width": 1200,
    "height": 630,
    "aspectRatio": 1.9047619,
    "description": "parking lots car",
    "last_edit_date": "2022-09-22T18:09:57.612Z",
    "createdAt": "2022-09-22T18:09:57.612Z",
    "updatedAt": "2022-09-22T18:09:57.612Z",
    "userId": 1
  },.......
]
```

`🔴Failed case: `


<hr>

### Search Post 

`Description:` Search post where result's title contains given title

`route:` GET /api/post/:title

`Params:` **title**: String

`Request Body:` None

Example:

GET /api/post/park

`🟢Success case: ` Status code: 200

```JSON
[
  {
    "id": 1,
    "title": "123 park 123",
    "postImgUrl": "image url",
    "width": 1200,
    "height": 630,
    "aspectRatio": 1.9047619,
    "description": "parking lots car",
    "last_edit_date": "2022-09-22T18:09:57.612Z",
    "createdAt": "2022-09-22T18:09:57.612Z",
    "updatedAt": "2022-09-22T18:09:57.612Z",
    "userId": 1
  },.......
]
```

`🔴Failed case: `
