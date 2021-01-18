# frozen_string_literal: true

set :branch, :main

server 'localhost', user: 'deploy', roles: %w[app migration]

set :rails_env, :production
set :stage, :staging
