#!/bin/bash

curl --include --request DELETE "http://localhost:4741/skiings/${ID}" \
--header "Authorization: Token token=${TOKEN}" \
