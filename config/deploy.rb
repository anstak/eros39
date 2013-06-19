require "bundler/capistrano"
load "deploy/assets"

set :application, "anstak"
set :repository,  "git@github.com:anstak/anstak.git"
set :scm, :git
server = "62.76.178.231"

role :web, server
role :app, server
role :db,  server, :primary => true # This is where Rails migrations will run

set :user, "user"

set :deploy_to, "/home/user/#{application}"
set :use_sudo, false

default_run_options[:shell] = '/bin/bash --login'
default_environment["RAILS_ENV"] = 'production'