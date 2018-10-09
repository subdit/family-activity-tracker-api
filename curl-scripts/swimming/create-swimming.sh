#!/bin/bash

curl --include --request POST "http://localhost:4741/swimmings" \
  --header "Content-Type: application/json"\
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "swimming": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "location": "'"${LOCATION}"'"
    }
  }'
