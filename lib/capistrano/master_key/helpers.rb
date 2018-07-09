require "yaml"

module Capistrano
  module MasterKey
    module Helpers

      def master_key_env
        fetch(:master_key_env).to_s
      end

      # error helpers
      def check_git_tracking_error
        puts
        puts "Error - please remove '#{fetch(:master_key_local_path)}' from git:"
        puts
        puts "    $ git rm --cached #{fetch(:master_key_local_path)}"
        puts
        puts "and gitignore it:"
        puts
        puts "    $ echo '#{fetch(:master_key_local_path)}' >> .gitignore"
        puts
      end

      def check_config_present_error
        puts
        puts "Error - '#{master_key_env}' config not present in '#{fetch(:master_key_local_path)}'."
        puts "Please populate it."
        puts
      end

      def check_master_file_exists_error
        puts
        puts "Error - '#{fetch(:master_key_local_path)}' file does not exists, and it's required."
        puts
      end

    end
  end
end

