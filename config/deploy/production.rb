# frozen_string_literal: true

set :branch, :main

server 'talker-test', user: 'deploy', roles: %w[app migration]

set :rails_env, :production
set :stage, :production
