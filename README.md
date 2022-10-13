# fullstack-instagram-clone

- cd web dev fullstack
- npm install
- npm run dev
- view page on localhost http://localhost:3010

#### Documentation

- Components that are being use by 2 or more components, create the component file in shared folder
- A new page that use the react router and routes go to pages, file naming follow the "ContentPage", example HomePage
- Some Component name will be specify, but not all, if specify use that naming for the component

#### Frontend Setup

- [VsCode Prettier code format setup format on save](https://www.youtube.com/watch?v=__eiQumLOEo)
- [VsCode setup for react javaScript development](https://www.youtube.com/watch?v=9EMUJm7qdxM)

```sh
node -v
npm -v

```

#### Useful mac terminal commands cheatsheet

[cheat sheet](https://github.com/0nn0/terminal-mac-cheatsheet)

#### Pcakage/Dependencies

#### Steps to learning and begginning to work on tickets

- The steps are all in the resource tab at trello, with learning resources.

#### Sprint diffculties point system

- Each ticket will have a point associated with them from 1 - 5
- 1 points ticket is the easiest and 5 points is the hardest

#### Priority Color system

- on trello colored red have more priorities over other colored label
- lighter clor lower priority compares to red

#### Current roadmaps React Frontend MUI(Material UI)

From frontend to backend

- UI/UX first and before actuall functionality
- Footer component
- NewPost component
- Login component
- registration component
- HomePage component
- Navbar component
- CardFeed component
- EditProfilePage component
- react router routes for differnt pages
  - Example UI button hover effects, and interactable UXs

#### Github work flow, commands

#### Developoment lifecycle :round_pushpin:

- git checkout -b feature_yourname || component_yourname

1. first when you start a new branch using following commands :pencil2:
2. name your branch by yourName/featureName
3.

```sh
git checkout -b yourName/featureName

```

git add .
git commit -m "commit message"
git push origin yourName/featureName

````

- commit message is bascically what are you pushing to github, what were you doing.

## make sure to pull from main when Pull request are merge

- at your own branch

```sh
git pull origin main
````

#### React

We use React with JavascriptScript for our frontend codebase.

#### Code Style Guide

We largely follow this react code style guidelines, [react syntax guidelines](https://github.com/pillarstudio/standards/blob/master/reactjs-guidelines.md), for creating components and file name.

#### Backend installation and setup instruction

#### Backend Apps/tools

- [postgreSQL-blank]()
- [Postico for mac-blank]()
- [Postman API enpoint testing](https://www.postman.com/downloads/)
- [Chrome json vue extention](https://chrome.google.com/webstore/detail/jsonvue/chklaanhfefbnpoihckbnefhakgolnmc)
- make sure node is intalled, can download at [Node](https://nodejs.org/en/download/)
- check installation by typing in cmd, or terminal

1. creates the database table with the model name
2. And then had a local db setup with [postgreSQL](https://www.postgresql.org/download/)
3. or download it with package manager homebrew for mac, or [chocolatey](https://chocolatey.org/) for winodws

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

run the backend server by typing, make sure to be in backend folder

```sh
cd backend
npm install
npm run dev
```

should see server started at port 8080

1. go to http://localhost:8080/api/post to get a json response
