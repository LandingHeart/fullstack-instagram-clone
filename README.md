# Project Motivation

This project is to teach and show student how to work on a collaboration project. And thus learning about the tech stacks.

#### Table of contents

- [INSTALL](https://github.com/LandingHeart/fullstack-instagram-clone/blob/main/docs/INSTALL.md)
- [mac cheat sheet](https://github.com/0nn0/terminal-mac-cheatsheet)
- [Database](https://github.com/LandingHeart/fullstack-instagram-clone/blob/main/docs/DATABASE.md)
- [Tools](https://github.com/LandingHeart/fullstack-instagram-clone/blob/main/docs/TOOLS.md)
- [Trello Board Join](https://trello.com/invite/b/QPkaa9nd/ATTI97cd43252a4c140940eafe428016a43d7AECAE38/fullstack-instagram-clone)

# Getting Started

#### Project Stack:

- React 17
- Redux Toolkit
- Node 16.18.0
- yarn 1.22.17
- PostgreSQL@14
- MUI
- express js 4.18.1
- sequelize
- heroku, netlify TBD
- morgan (logging HTTP request)
- winston

## CI/CD Pipeline
[circle ci](https://circleci.com/blog/what-is-a-ci-cd-pipeline/) - (WIP)

#### Github work flow, commands Developoment lifecycle :round_pushpin:
And all pull request should be made towards branch staging, only when it pass staging then it can made towards main. The merge for staging should be squash merge.

Only when all checks pass for main then it can be merge. The merge should be merge. 
- git checkout -b fsc-featureName
- first when you start a new branch using following commands :pencil2:
- name your branch by fsc-featureName

```sh
git checkout -b featureName
git add .
git commit -m "message"
git push origin featureName

```
Please follow this if you want to contribute and become a collaborator. 
[github offical doc](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork)
<br/>
[How to contribute to Open source](https://dev.to/codesphere/how-to-start-contributing-to-open-source-projects-on-github-534n)

#### React

We use React with Javascript for our frontend codebase.

#### Code Style Guide

We largely follow this react code style guidelines, [react syntax guidelines](https://github.com/pillarstudio/standards/blob/master/reactjs-guidelines.md), for creating components and file name.


## License 

MIT License

Copyright (c) [2022] Shinan Liu(Land)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
