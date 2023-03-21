require 'rails_helper'

RSpec.describe Event do
  describe 'associations' do

  end

  describe 'validations' do

  end

  describe 'instance variables' do
    describe '#add_vote' do
      it 'increases votes by 1' do
        event = create(:event)

        expect(event.votes).to eq(0)

        event.add_vote
        event.add_vote

        expect(event.votes).to eq(2)
      end
    end
  end
end