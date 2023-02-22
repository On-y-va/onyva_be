require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:airline_code) }
    it { should validate_presence_of(:flight_number) }
    it { should validate_presence_of(:date) }
  end
end