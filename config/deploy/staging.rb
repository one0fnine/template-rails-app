# frozen_string_literal: true

set :branch, :main

server 'talker-test', user: 'deploy', roles: %w[app migration sidekiq]

set :rails_env, :production
set :stage, :staging

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/#{fetch(:stage)}"
set :puma_service_unit_name, "puma_#{fetch(:application)}_#{fetch(:stage)}"

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"

set :sidekiq_service_unit_name, "sidekiq_#{fetch(:application)}_#{fetch(:stage)}"
