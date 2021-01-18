# frozen_string_literal: true

git_plugin = self

namespace :puma do
  namespace :systemd do
    desc 'Enable Puma systemd service'
    task :enable do
      on roles(fetch(:puma_role)) do
        "#{fetch(:puma_systemctl_bin)} --user enable #{fetch(:puma_service_unit_name)}"
      end
    end

    desc 'Disable Puma systemd service'
    task :disable do
      on roles(fetch(:puma_role)) do
        "#{fetch(:puma_systemctl_bin)} --user disable #{fetch(:puma_service_unit_name)}"
      end
    end
  end

  desc 'Start Puma service via systemd'
  task :start do
    on roles(fetch(:puma_role)) do
      execute :systemctl, '--user', :start, fetch(:puma_service_unit_name)
    end
  end

  desc 'Stop Puma service via systemd'
  task :stop do
    on roles(fetch(:puma_role)) do
      execute :systemctl, '--user', :stop, fetch(:puma_service_unit_name)
    end
  end

  desc 'Restart Puma service via systemd'
  task :restart do
    on roles(fetch(:puma_role)) do
      execute :systemctl, '--user', :restart, fetch(:puma_service_unit_name)
    end
  end

  desc 'Get Puma service status via systemd'
  task :status do
    on roles(fetch(:puma_role)) do
      execute :systemctl, '--user', :status, fetch(:puma_service_unit_name)
    end
  end
end
