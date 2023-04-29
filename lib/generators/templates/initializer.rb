# frozen_string_literal: true

module Types
  include Dry.Types()
end

Rails.autoloaders.each do |autoloader|
  autoloader.ignore(Dir[Rails.root.join('app', '**', '*{_spec.rb}')])
end
