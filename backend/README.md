## installation and setup instruction

## Made changes to model run

1. npm install
2. cd seeders
3. creates the database table with the model name
4. And then had a local db setup with [postgreSQL](https://www.postgresql.org/download/)
5. or download it with package manager homebrew for mac, or [chocolatey](https://chocolatey.org/) for winodws

```
psql postgres
postgres=#
```

![example_1](./db%20image/example.jpg)

```
postgres=# createdb insdb
postgres=# \c insdb
insdb=#
```

```bash
cd backend
npm install
npx sequelize-cli db:migrate
```

sequelizemeta will be created in database

1. go to http://localhost:8080/api/post to get a json response
2. npx sequelize-cli migration:create --name
3.
