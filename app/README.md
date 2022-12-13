#### Backend installation and setup instruction

#### Backend Apps/tools

Download postgresql with, make sure brew is install or follow [chocolatey](https://community.chocolatey.org/packages/postgresql)

```sh
brew install postgresql@14
```

Start the postgres database

```sh
brew services start postgresql@14
psql postgres
```

To connect to postgres db

```
psql postgres
postgres=#
```

create insdb and connect to insdb

```
createdb insdb
psql insdb
insdb=#
```

run the backend server by typing, make sure to be in backend folder

```sh
cd backend
npm install
npm run dev
```

should see server started at port 8080, go to http://localhost:8080/api/post to get a json response

#### db Migrations steps

1. npx sequelize-cli db:migrate
   db table created
2. npx sequelize-cli db:seed:all
   db data inserted

Should see the data being added to db tables

Create a .env file, Copy paste .env.example to .env

#### Frontend Setup/installation

```sh
cd client
npm install
npm run dev
```

go to [localhost:3010](http://localhost:3010/)
