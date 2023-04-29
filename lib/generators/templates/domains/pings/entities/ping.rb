# frozen_string_literal: true

class Pings::Entities::Ping < SimpleSetup::Entity
  attribute :message, Types::Strict::String
end
