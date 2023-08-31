# Scalingo Test

Ruby On Rails & Vue.JS hive managment application. Used Vuetify to simplify the front-end part.

## Installation

You will need to have Ruby and Node.JS installed. You can use nvm & rvm combo or ASDF for managing versions (.ruby-version & .nvmrc in the repo).

In this project, we will use ruby 3.2.1 and node 20.5.0, make sure that both are installed.


## Usage

The setup.sh script will kill rails background server on 3000 port, setup, launch a new one and setup and launch Vue server.

```
sh setup.sh
```

## Tests

To launch rails test as expected in the test do :
```
cd my-api
rails test
```

## Improvements

- Add custom date validation in rails for haverest date
- Update datetime picker to be responsive on mobile


## Time 

More than 4 hours :
Finished main subject including test in 2:10, after that : added image upload, harverest relation, eslint/rubocop, setup script and bit of refactoring.