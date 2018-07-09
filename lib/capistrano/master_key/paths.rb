require "pathname"

module Capistrano
  module MasterKey
    module Paths

      def master_key_local_path
        Pathname.new fetch(:master_key_local_path)
      end

      def master_key_remote_path
        shared_path.join fetch(:master_key_remote_path)
      end

    end
  end
end
