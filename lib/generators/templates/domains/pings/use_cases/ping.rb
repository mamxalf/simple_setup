# frozen_string_literal: true

class Pings::UseCases::Ping < SimpleSetup::UseCase
  def initialize(message:)
    @message = message
  end

  def call(as: :entity)
    @message = if @message.eql?('ping')
      'pong'
    elsif @message.eql?('pong')
      'ping'
    else
      "'#{@message}' not valid message, must 'ping' or 'pong' message!"
    end
    return failure @message unless %w[ping pong].include?(@message)

    Success response as, { message: @message }
  end

  private

  def response(as, resources)
    if as.to_s.eql?('resources')
      resources
    else
      entity resources
    end
  end

  def entity(resources)
    Pings::Entities::Ping.new(SimpleSetup::Model.new(resources))
  end
end
