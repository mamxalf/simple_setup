# frozen_string_literal: true

class Abstracts::Entity < Dry::Struct
  transform_keys(&:to_sym)
end
