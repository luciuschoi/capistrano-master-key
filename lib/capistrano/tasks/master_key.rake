include Capistrano::MasterKey::Paths
include Capistrano::MasterKey::Helpers

namespace :load do task :defaults do
    set :master_key_local_path, "#{ fetch(:local_repo_path) }/config/master.key"
    set :master_key_remote_path, 'config/master.key'
    set :master_key_env, -> { fetch(:rails_env) || fetch(:stage) }
  end
end

namespace :master_key do

  task :check_master_file_exists do
    next if File.exist?(master_key_local_path)
    check_master_file_exists_error
    exit 1
  end

  task :check_git_tracking do
    next unless system("git ls-files #{fetch(:master_key_local_path)} --error-unmatch >/dev/null 2>&1")
    check_git_tracking_error
    exit 1
  end

  desc "master.key file checks"
  task :check do
    raise(":deploy_to in your app/config/deploy/\#{environment}.rb file cannot contain ~") if shared_path.to_s.include?('~') # SCP doesn't support ~ in the path
    invoke "master_key:check_master_file_exists"
    invoke "master_key:check_git_tracking"
  end

  desc "Setup `master.key` file on the server(s)"
  task setup: [:check] do
    on release_roles :all do
      execute :mkdir, "-pv", File.dirname(master_key_remote_path)
      Net::SCP.upload!(self.host.hostname, self.host.user, master_key_local_path, master_key_remote_path)
    end
  end

  # Update `linked_files` after the deploy starts so that users'
  # `master_key_remote_path` override is respected.
  task :master_key_symlink do
    set :linked_files, fetch(:linked_files, []).push(fetch(:master_key_remote_path))
  end
  after "deploy:started", "master_key:master_key_symlink"

end
