#!/bin/sh

kill -9 $(lsof -i tcp:3000 -t)
cd ./my-api && bundle && rails db:setup
rails s -d -p 3000
cd ../scalingo-front && node -v && rm -rf node_modules && yarn && yarn dev
