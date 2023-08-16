require 'rails_helper'

RSpec.describe Dealing, type: :model do
  let(:user) { create(:user) }

  after do
    Dealing.destroy_all
    User.destroy_all
  end

  describe 'validations' do
    it 'creates a valid dealing' do
      dealing = build(:dealing, author: user)
      expect(dealing).to be_valid
    end
    
    it 'invalidates dealings with no names' do
      dealing = build(:dealing, name: nil, author: user)
      expect(dealing).to_not be_valid
    end
    
    it 'invalidates dealings with no amount' do
      dealing = build(:dealing, amount: nil, author: user)
      expect(dealing).to_not be_valid
    end
  end

  describe 'associations' do
    let(:user) { create(:user) }
    let(:dealing) { create(:dealing, author: user) }

    it 'belongs to a user' do
      expect(dealing.author).to eq(user)
    end

    it 'has and belongs to many dealings' do
      expect(dealing.groups).to eq([])
    end
  end
end
