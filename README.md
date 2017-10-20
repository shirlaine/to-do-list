# README

## Introduction
A to-do list with the following features:
- Search Bar
- User Log-in and Password
- Mark priority tasks

## System Specs
Ruby Version 2.4.1
Rails 5.1.4
Simple_form
Devise 4.0
Bootstrap 4.0 Beta
Rubocop

## Installation
Follow this guide for installation of the program.
1. Using your terminal, clone the repository to your computer.
```
git clone https://github.com/shirlaine/to-do-list.git
```

2. Install dependencies
```
bundle install
```

3. Install specific gems

Follow the instructions for gem installation for the following gems.
Simple_form - https://github.com/plataformatec/simple_form
Devise 4.0 - https://github.com/plataformatec/devise
Bootstrap 4.0 Beta - https://github.com/twbs/bootstrap
Rubocop - https://github.com/github/rubocop-github

4. Create the database
```
rake db:create db:migrate
```

## App Deployment
Run
```
rails s
```
In your browser, type
```
localhost:3000/tasklists
```
