lock '~> 3.15.0'

set :application, 'template-api-rails-app'
set :repo_url, 'ssh://git@github.com:one0fnine/template-rails-app.git'
set :user, 'deploy'

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

set :pty, true

set :linked_files,
  %w[config/database.yml config/master.key config/settings.local.yml config/storage.yml]

set :linked_dirs,
  %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/assets]

set :ssh_options, timeout: 30

set :migration_role, :migration
set :sidekiq_roles, :sidekiq
set :init_system, :systemd
set :assets_roles, :app

set :puma_role, :app
set :puma_workers, 4
set :puma_init_active_record, true
set :puma_threads, [8, 32]
set :puma_preload_app, true

namespace :deploy do
  before :publishing, 'db:seed'
end
