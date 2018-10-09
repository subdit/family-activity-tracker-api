#!/bin/bash
# curl --include --request GET "http://localhost:4741/foods" \
# from get-food.sh
 curl "http://localhost:4741/skiings" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"
