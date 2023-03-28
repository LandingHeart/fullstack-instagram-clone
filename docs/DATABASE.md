#### Database Setup

**Setup db in One command setup, make sure ran yarn or npm install before running this**

```sh
npm run setup-db
```

If it errors, `ERROR: permission denied to create database` do the following step.

```sh
createuser postgres
psql postgres
postgres=# GRANT ALL PRIVILEGES ON DATABASE insDB TO postgres;
postgres=# alter user postgres createdb;;
```

After npm run migrate, you can run npm run dev and open localhost:8080 to see the page.

#### Additional Database commands

```sh
npx sequelize-cli db:migrate
```

Migrate will run the files in migration folder, and will create database tables.

```sh
npx sequelize-cli db:seed:all
```

or

```sh
npx sequelize-cli db:seed filename
```

it will run the files in the seeders folder and insert the data into the table

Create the database admin user if errors.

List of database commands

```sh
psql insdb
insdb=# \list
```
