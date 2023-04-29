# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Pings::Entities::Ping do
  let(:model_ping) do
    SimpleSetup::Model.new(
      message: 'ping'
    )
  end
  let(:attributes) { model_ping.attributes }
  let(:ping_entity) { described_class.new(attributes) }
  let(:column_names) { %i[message] }

  describe '# Valid attribute' do
    it { expect(ping_entity).to be_an_instance_of(described_class) }

    it {
      expect(ping_entity).to include(message: 'ping')
    }

    it 'is valid column attributes' do
      expect(ping_entity.to_h.keys - column_names).to eq([])
    end
  end
end
