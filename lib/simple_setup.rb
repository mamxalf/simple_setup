# frozen_string_literal: true

require_relative 'simple_setup/version'

require 'devise'
require 'dry-matcher'
require 'dry-monads'
require 'dry-struct'
require 'dry-validation'
require 'pagy'
require 'faker'
require 'types'
require 'hashie'

module SimpleSetup
  class Error < StandardError; end

  class Entity < Dry::Struct
    transform_keys(&:to_sym)
  end

  class Pagination < Entity
    attribute :offset, Types::Strict::Integer
    attribute :limit, Types::Strict::Integer
    attribute :total, Types::Strict::Integer
  end

  class UseCase
    include Dry::Monads[:result]
    include Pagy::Backend

    def paginate!(pagy, _response, count: nil)
      pages = {
        offset: pagy.page,
        total:  (count.presence || pagy.count),
        limit:  pagy.items
      }

      Pagination.new(pages)
    end
  end

  class Model < Hashie::Mash
    def initialize(params)
      params.each_pair do |k, v|
        self[k] = v
      end
      @attributes = params
    end

    def attributes
      ActiveSupport::HashWithIndifferentAccess.new(@attributes).symbolize_keys
    end
  end
end
