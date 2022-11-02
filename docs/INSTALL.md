## INSTALL

1. [Install brew](https://brew.sh/)
2. [Install chocolatey](https://chocolatey.org/) for winodws
3. [Install node version manager](https://github.com/nvm-sh/nvm/blob/master/README.md)

#### Install node with brew

```sh
brew install node
node --version
18.0.0
```

#### nvm command to use node version 16.18.0

```sh
nvm install 16.18.0
nvm use 16.18.0
node --version
16.18.0
```

#### nodenv

```sh
nodenv install 16.18.0
nodenv global 16.18.0
```

#### Install PostgreSQL with brew

```sh
brew install postgresql@14
```

#### Install postgresql with chocolatey

[doc](https://danabases.net/posts/2020-2-15-postgres-chocolatey/)
[chocolatey](https://community.chocolatey.org/packages/postgresql) make sure to install as admin

Start the postgres database

```sh
brew services start postgresql@14
```

Connect to database to verify installation

```sh
psql postgres
postgres=#
postgres=# \q
```

Create database

```sh
createdb insdb
psql insdb
insdb=#
```

When you see insdb=# means you are connected. <br/>

#### start backend server

Run the backend server

```sh
cd backend
npm install
npm run dev
```

Should see server started at port 8080 at console, go to http://localhost:8080/api/post to get a json response

#### start frontend server

```sh
cd frontend
npm install
npm run dev
```

[localhost:3010](http://localhost:3010/)
