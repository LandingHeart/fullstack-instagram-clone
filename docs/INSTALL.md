## Installation Guide

### Requirements

Before starting with the installation process, make sure you have the following requirements installed:

- [brew](https://brew.sh/) Mac
- [chocolatey](https://chocolatey.org/) Windows
- [nodenv](https://github.com/nodenv/nodenv) Follow readme guide

#### Install node with brew

```shell
brew install node
node --version
18.0.0
```

#### or you can use nodenv to set node version

```shell
nodenv install 16.14.2
nodenv global 16.14.2
```

#### Install PostgreSQL with brew

```shell
brew install postgresql@14
```

```shell
brew services start postgresql@14
```

#### Install postgresql with chocolatey

[chocolatey](https://community.chocolatey.org/packages/postgresql) make sure to install as admin, follow chocolatey instruction to set up the database
[Easy Postgres Installation and Setup on Windows with Chocolatey](https://danabases.net/posts/2020-2-15-postgres-chocolatey/)
[stack overflow start postgres on windows](https://stackoverflow.com/questions/36629963/how-can-i-start-postgresql-on-windows)
Start the postgres database

#### Database Setup

**Setup db in One command setup, make sure ran yarn or npm install before running this**

```shell
npm run setup-db
```

If it errors, `ERROR: permission denied to create database` do the following step.

```shell
createuser postgres
psql postgres
postgres=# GRANT ALL PRIVILEGES ON DATABASE insDB TO postgres;
postgres=# alter user postgres createdb;;
```

After npm run migrate, you can run npm run dev and open localhost:8080 to see the page.

#### Additional Database commands

```shell
npx sequelize-cli db:migrate
```

Migrate will run the files in migration folder, and will create database tables.

```shell
npx sequelize-cli db:seed:all
```

or

```shell
npx sequelize-cli db:seed filename
```

it will run the files in the seeders folder and insert the data into the table

Create the database admin user if errors.

List of database commands

```shell
psql insdb
insdb=# \list
```
