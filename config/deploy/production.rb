# frozen_string_literal: true

set :branch, :main

server '', user: 'deploy', roles: %w[app sidekiq migration]

set :rails_env, :production
set :role_app, :production
