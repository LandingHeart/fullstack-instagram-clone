### Project Overview

This project is a full-stack clone of the popular Instagram application. Its main purpose is to teach students how to work on a collaborative project and to help them learn about the different technology stacks involved in building such an application.

### Motivation

The motivation behind this project is to provide students with a hands-on experience in working on a real-world project, which involves collaboration with other developers. This project will also help students learn about the different technologies involved in building a full-stack application like Instagram.

### Getting Started

Follow the install instruction doc to get the project started, and environment setup.

### Quick start Guide

#### Requirements

- node
- postgreSQL

Create .env file and copy paste .env.example to .env.

```shell
npm install
npm run setup-db
npm run dev
```

Server start at [localhost](http://localhost:8080/)

### Table of contents

- [INSTALL](/docs/INSTALL.md)
- [CONTRIBUTING](/docs/CONTRIBUTING.md)
- [RELEASE NOTE](/docs/RELEASE_NOTE.md)
- [LICENSE](/docs/LICENSE.md)

### Tech Stack:

- Frontend
  - React 17
  - MUI
  - UiKit
  - Swift 5.4
  - Redux Toolkit
- Backend
  - Node 16.18.0
  - express js 4.18.1
  - PostgreSQL@14
  - sequelize
  - yarn 1.22.17
  - heroku
  - morgan/winston
  - JWT (authentication)
- CICD
  - circle ci

### iOS mobile application

The mobile application is build with Swift and UiKit. The source code is under branch `main-ios`

### Code Style Guide

We largely follow this react code style guidelines, [react syntax guidelines](https://github.com/pillarstudio/standards/blob/master/reactjs-guidelines.md), for creating components and file name.

### License

[MIT](/docs/LICENSE.md) License
