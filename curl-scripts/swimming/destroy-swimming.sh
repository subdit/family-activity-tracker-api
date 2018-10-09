#!/bin/bash

curl --include --request DELETE "http://localhost:4741/swimmings/${ID}" \
--header "Authorization: Token token=${TOKEN}" \
