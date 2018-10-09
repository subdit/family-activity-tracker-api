#!/bin/bash

curl --include --request PATCH "http://localhost:4741/skiings/${ID}" \
  --header "Content-Type: application/json"\
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "skiing": {
      "name": "'"${NAME}"'"
    }
  }'

echo
