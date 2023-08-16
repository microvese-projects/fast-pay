require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { create(:user) }

  after do
    Group.destroy_all
    User.destroy_all
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      group = build(:group, user: user)
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group = build(:group, name: nil, user: user)
      expect(group).not_to be_valid
    end

    it 'is not valid without an icon' do
      group = build(:group, icon: nil, user: user)
      expect(group).not_to be_valid
    end
  end

  describe 'associations' do
    let(:user) { create(:user) }
    let(:group) { create(:group, user: user) }

    it 'belongs to a user' do
      expect(group.user).to eq(user)
    end

    it 'has and belongs to many dealings' do
      expect(group.dealings).to eq([])
    end
  end
end
