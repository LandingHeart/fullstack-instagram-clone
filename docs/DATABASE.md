### Database Setup

#### db Migrations steps and seeding database

```sh
npx sequelize-cli db:migrate
npx sequelize-cli db:seed:all
```

migrate will run the files in migration folder, and will create db table .
it will run the files in seeders folder db data inserted, db rows inserted.

If postgresql is installed you can use the psql command.

```sh
psql insdb
insdb=# \list
```

If user does not exist, create user by

```sh
createuser postgres
psql postgres
postgres=# GRANT ALL PRIVILEGES ON DATABASE insDB TO postgres;
```

| Role name | list of roles | member of |
| --------- | ------------- | --------- |
| postgres  |               |           |
