#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), 'ci-helpers'))

# before_script
uninstall_gem 'calabash-cucumber'

working_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..'))


# noinspection RubyStringKeysInHashInspection
env_vars =
      {
            'TRAVIS' => '1',
      }

Dir.chdir working_dir do

  # before_script
  do_system('script/ci/travis/install-static-libs.rb',
            {:env_vars => env_vars})

  do_system('script/ci/travis/bundle-install.rb',
            {:env_vars => env_vars})

  # test scripts
  do_system('script/ci/travis/install-gem-ci.rb',
            {:env_vars => env_vars})

  do_system('script/ci/travis/rspec-ci.rb',
            {:env_vars => env_vars})

  do_system('script/ci/travis/unit-ci.rb',
            {:env_vars => env_vars})

  do_system('script/ci/travis/cucumber-ci.rb --tags ~@no_ci',
            {:env_vars => env_vars})

end
