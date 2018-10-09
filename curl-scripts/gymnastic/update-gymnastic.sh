#!/bin/bash

curl --include --request PATCH "http://localhost:4741/gymnastics/${ID}" \
  --header "Content-Type: application/json"\
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "gymnastic": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "location": "'"${LOCATION}"'"
    }
  }'

echo
