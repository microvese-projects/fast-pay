require 'rails_helper'

RSpec.describe 'dealings/new', type: :feature do
  let(:user) { create(:user) }

  before do
    user.save
    sign_in user
    @group = FactoryBot.create(:group, user:)
  end

  after do
    Dealing.destroy_all
    Group.destroy_all
    User.destroy_all
  end

  scenario 'New dealing' do
    visit new_user_group_dealing_path(user, @group)
    expect(page).to have_current_path(new_user_group_dealing_path(user, @group))

    fill_in 'dealing_name', with: 'Pizza'
    fill_in 'dealing_amount', with: 10

    click_button 'Create Dealing'

    expect(page).to have_current_path(user_group_path(user, @group))
    expect(page).to have_content('Pizza')
  end
end
