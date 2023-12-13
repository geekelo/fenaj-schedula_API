<a name="readme-top"></a>
# 🏥 Fenaj Schedula API <a name="about-project"></a>

> The Room Rental API allows users to create an account book a new Room and can reserve the Room.


### Database Schema <a name="ER-diagram"></a>

<div align="center">
 <img src="./fenaj-schedula.jpg" alt="schema" width="600"  height="auto" />
  <br/>
</div>                                       

### Frontend Repository
[Fenaj Schedula Front End](https://github.com/geekelo/fenaj-schedula)

## Project Kanban board:
[Kanban-board](https://github.com/users/geekelo/projects/3)

## 🛠 Built With <a name="built-with"></a>

  <ul>
    <li>Ruby</li>
    <li>Ruby on Rails</li>
    <li>Postgres SQL</li>
  </ul>

### Key Features <a name="key-features"></a>

- [x] Create a user based on the role
- [x] Create a session and view all sessions
- [x] Create reservations and view all reservations

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Command line or terminal
- IDE such as VsCode.
- Rails needs to be installed on your system.

### Setup

Clone this repository to your desired folder:
Example command:

```sh
  git clone git@github.com:geekelo/fenaj-schedula_API.git
```

### Install

Example command:

```sh
  cd fenaj-schedula_API
  bundle install (install all dependencies)
  rails db:create (to create database)
  rails db:migrate (to migrate tables)

```

### Usage

To run the project redirecting to the root directory of the project and run the following command:

```sh
 bin/rails server (to run web API)

```