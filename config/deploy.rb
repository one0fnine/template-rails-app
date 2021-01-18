lock '~> 3.15.0'

set :rbenv_ruby, '3.0.0'
set :application, 'template-api-rails-app'
set :repo_url, 'ssh://git@github.com/one0fnine/template-rails-app.git'

set :user, 'deploy'
set :rbenv_type, :user

set :pty, false

set :linked_files,
  %w[config/database.yml config/master.key config/storage.yml]

set :linked_dirs,
  %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/assets]

set :ssh_options, forward_agent: true, user: fetch(:user), timeout: 30

set :rbenv_type, :user

set :migration_role, :migration
set :sidekiq_roles, :sidekiq

# Puma
set :puma_role, :app
set :puma_workers, 4
set :puma_init_active_record, true
set :puma_threads, [8, 32]
set :puma_preload_app, true
set :puma_worker_timeout, nil

namespace :deploy do
  before :updating, :'puma:monit:unmonitor'
  after :starting, :'sidekiq:quiet'
  after :published, :'sidekiq:restart'
  after :finishing, :'puma:monit:monitor'
end
