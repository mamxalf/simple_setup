# frozen_string_literal: true

RSpec.describe SimpleSetup do
  it 'has a version number' do
    expect(SimpleSetup::VERSION).not_to be nil
  end

  it 'does something useful' do
    expectation = true
    expect(expectation).to eq(true)
  end
end
