#!/bin/bash

npm install -g heroku && heroku plugins:install heroku-cli-deploy && heroku deploy:jar target/app.jar --app spring-boot-angular-app

