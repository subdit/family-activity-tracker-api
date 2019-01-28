## Family-Activiy-Tracker-API ##
The purpose of API repository of full stack web application is to support the Family-Activiy-Tracker (frontend) application for the user to interact with. This app allows the user to create, update, delete and view the activity events that users have create. This full stack application was inspring by a busy family.

## Main Idea ##
The main reason behind this project was from my own family, that I have a problem to keep track of the date for my children events and activities. I want to be able to use calendar to bookmark the events, and location. The most important thing is the users be able to create, update, view and delete their own event that they have creted.

API deployed: https://warm-sea-24073.herokuapp.com/
API repo: https://github.com/subdit/family-activity-tracker-api

## Links to Client frontend ##
Family-Activity-Tracker-client:https://github.com/subdit/family-activity-tracker-client

## Wireframe ##
Under developing
This wireframe or ERD (Entity Relationship Diagram).
This project can be expended from version 1 to version 2(one to many and many to many) and version 3 which I did not include in this project.

## Planning ##
I start by setting up Model, Controller and authentication files and test the CRUD in cirl script that using localhost after all test pass I moving to the front-end client. 

## Prerequisites
 @Dependencies
 Install with bundle install.

## Customize Template:##
@Setup Environment:
 - Install dependencies with bundle install.
 - git add and git commit your changes.
 - Create a .env for sensitive settings (touch .env).
 - Generate new development and test secrets (bundle exec rails secret).
 - Store them in .env with keys SECRET_KEY_BASE_<DEVELOPMENT|TEST> respectively.
 - In order to make requests to your deployed API, you will need to set @SECRET_KEY_BASE in the environment of the production API (for example, using heroku @config:set or the Heroku dashboard)
   - In order to make requests from your deployed client application, you will need to set CLIENT_ORIGIN in the environment of the production API (for example, heroku config:set CLIENT_ORIGIN=https://<github-username>.github.io). See more about deploying to heroku rails-heroku-setup-guide
 @Setup your database:
  - bin/rails db:drop (if it already exists)
  - bin/rails db:create
  - bin/rails db:migrate
  - bin/rails db:seed
  - bin/rails db:examples
@Note: Remember to follow the same commands when setting up your deployed database!

@Run your server!
  - Run the API server with bin/rails server or bundle exec rails server.
  - Structure: This template follows the standard project structure in Rails.
  - Curl command scripts are stored in curl-scripts with names that correspond to API actions.

## User authentication is built-in ##

@Developers should run these often!
  - bin/rails routes lists the endpoints available in your API.
  - bin/rspec spec runs automated tests.
  - bin/rails console opens a REPL that pre-loads the API.
  - bin/rails db opens your database client and loads the correct database.
  - bin/rails server starts the API.
curl-scripts/*.sh run various curl commands to test the API. See below.
  - @API
Use this as the basis for your own API documentation. Add a new third-level heading for your custom entities, and follow the pattern provided for the built-in user authentication documentation.

  - Scripts are included in curl-scripts to test built-in actions. Add your own scripts to test your custom API. As an alternative, you can write automated tests in RSpec to test your API.

  - @Authentication
    Verb	URI Pattern	Controller#Action
    POST	/sign-up	users#signup
    POST	/sign-in	users#signin
    PATCH	/change-password	users#changepw
    DELETE	/sign-out	users#signout
    POST /sign-up
    Request:

curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
Response:

HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
POST /sign-in
Request:

curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-in.sh
Response:

HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
PATCH /change-password
Request:
curl --include --request PATCH "http://localhost:4741/change-password" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
OLDPW='hannah' NEWPW='elle' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/change-password.sh
Response:

HTTP/1.1 204 No Content
DELETE /sign-out
Request:

curl http://localhost:4741/sign-out \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/sign-out.sh

Response:
HTTP/1.1 204 No Content
Users
Verb	URI Pattern	Controller#Action
GET	/users	users#index
GET	/users/1	users#show
PATCH	/users/1	users#update
GET /users
Request:

curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f curl-scripts/users.sh

## Response: ##
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
GET /users/:id
Request:

curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f curl-scripts/user.sh

## Response: ##
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
PATCH /users/:id
Request:

curl "http://localhost:4741/users/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "user": {
      "email": "'"${EMAIL}"'"
    }
  }'
ID=1 TOKEN="BAhJIiU1NGNlYjRmMjBhM2NkZTZiNzk1MGNiYmZiYWMyY2U4MwY6BkVG--ddb1e16af0e05921aa56d771e4a2f816f2a1d46e"
EMAIL=mike@m
sh curl-scripts/users/user-update.sh
Response:

HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{"user":{"id":1,"email":"mike@m"}}
Reset Database without dropping
This is not a task developers should run often, but it is sometimes necessary.

## locally ##
  - bin/rails db:migrate VERSION=0
  - bin/rails db:migrate db:seed db:examples

## heroku ##
  - heroku run rails db:migrate VERSION=0
  - heroku run rails db:migrate db:seed db:examples

## Additional Resources ##
rails-heroku-setup-guide
http://guides.rubyonrails.org/api_app.html
https://blog.codeship.com/building-a-json-api-with-rails-5/


## License ##
All content is licensed under a CC­BY­NC­SA 4.0 license.
All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.

@Copy right@kasidit_bualoeng
