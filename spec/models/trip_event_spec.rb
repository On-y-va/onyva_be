require 'rails_helper'

RSpec.describe TripEvent, type: :model do
  describe 'relationships' do
    it { should belong_to(:trip)}
  end

  describe 'validations' do
    it { should validate_presence_of(:event_id) }
  end
end