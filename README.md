### fullstack-instagram-clone

#### Documentation

- Components that are being use by 2 or more components, create the component file in shared folder
- A new page that use the react router and routes go to pages, file naming follow the "ContentPage", example HomePage
- Some Component name will be specify, but not all, if specify use that naming for the component

#### Frontend Setup

- [VsCode Prettier code format setup format on save](https://www.youtube.com/watch?v=__eiQumLOEo)
- [VsCode setup for react javaScript development](https://www.youtube.com/watch?v=9EMUJm7qdxM)
- [use node version manager](https://github.com/nvm-sh/nvm/blob/master/README.md), use the link to setup node version manager.

Lets use node version 16 for this project node version v16.18.0

```sh
node -v
v16.18.0
npm -v
8.19.2
```

#### Useful mac terminal commands cheatsheet

[cheat sheet](https://github.com/0nn0/terminal-mac-cheatsheet)

#### Pcakage/Dependencies

#### Steps to learning and begginning to work on tickets

- The steps are all in the resource tab at trello, with learning resources.

#### Sprint diffculties point system

- Each ticket will have a point associated with them from 1 - 5
- 1 points ticket is the easiest and 5 points is the hardest

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

1. Download postgresdb with [homebrew](https://docs.brew.sh/Installation) package manager for mac, or [chocolatey](https://chocolatey.org/) for winodws
2. Follow the documentation to install brew or chocolatey.

Download postgresql with 
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

should see server started at port 8080

1. go to http://localhost:8080/api/post to get a json response
