#!/bin/bash

curl --include --request PATCH "http://localhost:4741/swimmings/${ID}" \
  --header "Content-Type: application/json"\
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "swimming": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "location": "'"${LOCATION}"'"
    }
  }'

echo
