# frozen_string_literal: true

# lib/generators/simple_setup/ping.rb
module SimpleSetup
  # this is ping generator example
  class PingGenerator < Rails::Generators::Base
    argument :name, type: :string, required: true

    def create_ping
      template 'ping.rb', "lib/#{name}/ping.rb"
    end

    private

    def source_paths
      [File.expand_path('../templates', __dir__)]
    end
  end
end
