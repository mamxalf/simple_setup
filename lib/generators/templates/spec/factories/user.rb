# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { 'password' }
  end
end
