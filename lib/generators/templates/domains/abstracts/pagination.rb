# frozen_string_literal: true

class Abstracts::Pagination < Abstracts::Entity
  attribute :offset, Types::Strict::Integer
  attribute :limit, Types::Strict::Integer
  attribute :total, Types::Strict::Integer
end
