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

#### nvm command to use node version 16.14.2

```sh
nvm install 16.14.2
nvm use 16.14.2
node --version
16.14.2
```

#### or you can use nodenv to set node version

```sh
nodenv install 16.14.2
nodenv global 16.14.2
```

#### Install PostgreSQL with brew

```sh
brew install postgresql@14
```

#### Install postgresql with chocolatey

[chocolatey](https://community.chocolatey.org/packages/postgresql) make sure to install as admin, follow chocolatey instruction to set up the database
[Easy Postgres Installation and Setup on Windows with Chocolatey](https://danabases.net/posts/2020-2-15-postgres-chocolatey/)
[stack overflow start postgres on windows](https://stackoverflow.com/questions/36629963/how-can-i-start-postgresql-on-windows)
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
