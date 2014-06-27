# config valid only for Capistrano 3.1
lock '3.1.0'

set :stage, :production

set :application, 'contraband_empire'
set :scm, :git
set :repo_url, "git@github.com:gtcbe/cbe-website.git"
set :deploy_via, 'file://.git/'

set :deploy_to, "/home/deploy/contraband_empire"
set :user, "deploy"
set :use_sudo, false

set :rails_env, "production"

set :keep_releases, 5

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :pty, true

set :domain, 'www.contraband-empire.com'

roles :all,  fetch(:domain)

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  
  desc "Symlink shared config files"
	task :symlink_config_files do
		run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
	end

  after :publishing, :restart
  after :finishing, 'deploy:cleanup'
  
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
