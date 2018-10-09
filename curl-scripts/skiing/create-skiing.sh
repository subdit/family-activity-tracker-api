#!/bin/bash

curl --include --request POST "http://localhost:4741/skiings" \
  --header "Content-Type: application/json"\
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "skiing": {
      "name": "'"${NAME}"'",
      "date": "'"${DATE}"'",
      "location": "'"${LOCATION}"'"
    }
  }'
