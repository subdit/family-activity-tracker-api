Family Activiy Tracker
Inspring by the busy parents

Backend link:https://github.com/subdit/family-activity-tracker-api :https://warm-sea-24073.herokuapp.com/

Links to the frontend :https://github.com/subdit/family-activity-tracker-client :https://subdit.github.io/family-activity-tracker-client/

rails-api-template
A template for starting projects with rails-api. Includes authentication.

At the beginning of each cohort, update the versions in Gemfile.

Prerequisites
rails-api-examples-walkthrough
Dependencies
Install with bundle install.

rails-api
rails
active_model_serializers
ruby
postgres
Installation
Download Template:
Download this template.
Unzip and rename the template directory (unzip ~/Downloads/rails-api-template-master.zip)
Move into the new project and git init.
Customize Template:
Empty README.md and fill with your own content.
Rename your app module in config/application.rb (change RailsApiTemplate).
Rename your project database in config/database.yml (change 'rails-api-template').
Setup Environment:
Install dependencies with bundle install.
git add and git commit your changes.
Create a .env for sensitive settings (touch .env).
Generate new development and test secrets (bundle exec rails secret).
Store them in .env with keys SECRET_KEY_BASE_<DEVELOPMENT|TEST> respectively.
In order to make requests to your deployed API, you will need to set SECRET_KEY_BASE in the environment of the production API (for example, using heroku config:set or the Heroku dashboard).
In order to make requests from your deployed client application, you will need to set CLIENT_ORIGIN in the environment of the production API (for example, heroku config:set CLIENT_ORIGIN=https://<github-username>.github.io). See more about deploying to heroku rails-heroku-setup-guide
Setup your database:
- bin/rails db:drop (if it already exists)
- bin/rails db:create
- bin/rails db:migrate
- bin/rails db:seed
- bin/rails db:examples
Note: Remember to follow the same commands when setting up your deployed database!

Run your server!
Run the API server with bin/rails server or bundle exec rails server.
Structure
This template follows the standard project structure in Rails.

curl command scripts are stored in curl-scripts with names that correspond to API actions.

User authentication is built-in.

Tasks
Developers should run these often!

bin/rails routes lists the endpoints available in your API.
bin/rspec spec runs automated tests.
bin/rails console opens a REPL that pre-loads the API.
bin/rails db opens your database client and loads the correct database.
bin/rails server starts the API.
curl-scripts/*.sh run various curl commands to test the API. See below.
API
Use this as the basis for your own API documentation. Add a new third-level heading for your custom entities, and follow the pattern provided for the built-in user authentication documentation.

Scripts are included in curl-scripts to test built-in actions. Add your own scripts to test your custom API. As an alternative, you can write automated tests in RSpec to test your API.

Authentication
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
Response:

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
Response:

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

locally

bin/rails db:migrate VERSION=0
bin/rails db:migrate db:seed db:examples
heroku

heroku run rails db:migrate VERSION=0
heroku run rails db:migrate db:seed db:examples
Additional Resources
rails-heroku-setup-guide
http://guides.rubyonrails.org/api_app.html
https://blog.codeship.com/building-a-json-api-with-rails-5/
License
All content is licensed under a CC­BY­NC­SA 4.0 license.
All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.
family-activity-tracker-api
