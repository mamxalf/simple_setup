# frozen_string_literal: true

require_relative 'simple_setup/version'

require 'devise'
require 'dry-matcher'
require 'dry-monads'
require 'dry-struct'
require 'dry-validation'
require 'pagy'
require 'faker'

module SimpleSetup
  class Error < StandardError; end
  # Your code goes here...
end
