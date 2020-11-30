Work To Do (Test)
---

Statement:

Use PostgreSQL as database
1. Create an authentication mechanism, with Bearer access token (JWT) with devise support:
  The user must have the following attributes (name, last name, cellphone, password, birthdate)
2. Create the necessary models for a user and group-based to-do list app:
  A TO-DO App it’s an app that helps manage the state of the tasks related to a user.
  Expected models to be created:
    - User
    - Task (name, description, position, priority, state). The Task model has some tasks related as subtasks (has to be the same model) All task is public, but when a regular user sees a task that is not his then the only fields shown are name and priority
    - Category (a polymorphic model that could be associated both to the user and task models and future ones)
    - Project (name, description, due_date, owner, task_list)
3. Create the necessary API endpoints to manage the to-do lists and share items with your group or other users
4. The endpoints must support the selection via params of the attributes to be returned (The endpoint must receive the params expected to be returned, must be dynamic. Only name and ID, instead of a name, id, description, due_date, etc...)
5. Use FactoryBot and Faker
6. Must be multilanguage with correct attribute names and model names in Spanish and English.
7. All error messages should be also translated using model locale config files
8. The work must include all test based on RSpec
---
Stack:
- Ruby on Rails (6.0.3)
- Ruby (2.7.2)
- Rspec
- Rubocop
---
- This system has an authentication system with JWT
- The seed file contain all initial data for working
- For navigation for app with internalization need add to url the language
```
    host/es/
    host/en/
```
- For more details you can see the documentation at the end

Start to work:
- First step, clone the project 
```
    git clone git@github.com:Dach3r/work-to-do-test.git
```

- Please create your db config
```
    config/database.yml
```

- Run this code for create the DB
```
    rails db:create && rails db:migrate && rails db:seed
```

- And now only run this command for start server
```
    rails s
```

Rspec:

![Rspec Test](https://i.imgur.com/chF8ks7.png)

Rubocop:

![Rubocop Test](https://i.imgur.com/hkAQb7B.png)

Documentation: https://documenter.getpostman.com/view/5285679/TVmJgy3v

Developer: (David Noreña / [dnorena415@gmail.com](mailto:dnorena415@gmail.com))