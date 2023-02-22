require 'rails_helper'

RSpec.describe TripAttendee, type: :model do
  describe 'relationships' do
    it { should belong_to(:trip)}
    it { should belong_to(:user)}
  end
end