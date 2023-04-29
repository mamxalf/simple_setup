# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::UseCases::GetListUsers, type: :use_case do
  before do
    create_list(:user, 100)
  end

  it 'is true when get list user' do
    pagy, = described_class.new(params: {}).call
    expect(pagy.vars).to include(count: 100, page: 1, items: 20)
  end
end
