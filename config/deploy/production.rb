# frozen_string_literal: true

set :branch, :main

server 'talker-test', user: 'deploy', roles: %w[app migration sidekiq]

set :rails_env, :production
set :role_app, :production
