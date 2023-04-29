# frozen_string_literal: true

# lib/generators/simple_setup/complete/install_generator.rb
module SimpleSetup
  # Complete Generator
  module Complete
    # this is ping generator example
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __dir__)

      class_option :model, type: :string, default: 'User', desc: 'Naming Model for Devise'
      class_option :meraki_template, type: :boolean, default: false, desc: 'Auth with Meraki UI Template'
      class_option :dashboard_path, type: :hash, default: { dashboard: :index },
                                    desc: 'Dashboard with Meraki UI Template depent on meraki_template'

      def generate_devise
        # 1. install devise
        Rails::Command.invoke 'generate', %w[devise:install]
        # 2. generate devise model for authentication
        Rails::Command.invoke 'generate', ['devise', options[:model]]
      end

      def generate_rubocop
        system 'bundle exec rubocop --auto-gen-config'
        # TODO: adjust template without force
        copy_file 'rubocop/.rubocop.yml', '.rubocop.yml', force: true
      end

      def generate_rspec
        Rails::Command.invoke 'generate', ['rspec:install']
        # TODO: adjust template without force
        copy_file 'spec/rails_helper.rb', 'spec/rails_helper.rb', force: true
        directory 'spec/factories', 'spec/factories', force: true
        directory 'spec/support', 'spec/support', force: true
      end

      def set_pattern_example
        copy_file 'initializer.rb', 'config/initializers/simple_setup.rb'
        directory 'domains', 'app/domains'
        directory 'test', 'test'
      end

      # def set_meraki_template
      #   if options[:meraki_template]
      #     # copy auth template
      #     Rails::Command.invoke 'generate', ['--help']
      #     # generate dashboard path
      #     params = options[:dashboard_path].transform_keys(&:to_s).transform_values(&:to_s)
      #     Rails::Command.invoke 'generate', ['controller', params.keys.first, params[params.keys.first],
      #                                         '--no-helper']
      #   end
      # end
    end
  end
end
