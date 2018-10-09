#!/bin/bash

curl --include --request DELETE "http://localhost:4741/gymnastics/${ID}" \
--header "Authorization: Token token=${TOKEN}" \
