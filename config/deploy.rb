lock '~> 3.15.0'

set :application, 'template-api-rails-app'
set :repo_url, 'ssh://git@github.com/one0fnine/template-rails-app.git'

set :user, 'deploy'
set :rbenv_type, :user
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}/#{fetch(:role_app)}"

set :pty, false

set :linked_files,
  %w[config/database.yml config/master.key config/storage.yml]

set :linked_dirs,
  %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/assets]

set :ssh_options, forward_agent: true, user: fetch(:user), timeout: 30

set :rbenv_type, :user

set :migration_role, :migration
set :sidekiq_roles, :sidekiq

# Sidekiq
set :init_system, :systemd

# Puma
set :puma_role, :app
set :puma_workers, 4
set :puma_init_active_record, true
set :puma_threads, [8, 32]
set :puma_preload_app, true
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_worker_timeout, nil

namespace :deploy do
  before :starting, :'puma:monit:unmonitor'
  after :finishing, :'puma:monit:monitor'
end
