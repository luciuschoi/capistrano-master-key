# Capistrano:MasterKey

Capistrano tasks for handling `master.key` when deploying Rails 5.2+ apps.

### Install

Add this to `Gemfile`:

    group :development do
      gem 'capistrano', '~> 3.11.0'
      gem 'capistrano-master-key', '~> 1.0.0'
    end

And then:

    $ bundle install

### Setup and usage

- Make sure your local `config/master.key` is not git tracked. It **should be on
  the disk**, but gitignored.

- Add to `Capfile`:

        require 'capistrano/master_key'

- Add your local_repo_path setting to your deploy.rb file (or wherever you need if you have multi-repo setup)

    `set :local_repo_path, "/home/myname/mycode/repo_path"

- You will have now a working master_key:setup

### License

[MIT](LICENSE.md)
