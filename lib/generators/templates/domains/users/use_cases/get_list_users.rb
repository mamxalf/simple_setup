# frozen_string_literal: true

class Users::UseCases::GetListUsers < SimpleSetup::UseCase
  def initialize(params:)
    @params = params
  end

  def call
    pagy(User.all)
  end

  private

  attr_reader :params
end
