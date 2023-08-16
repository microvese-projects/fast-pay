require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  let(:user) { create(:user) }

  before do
    user.save
    sign_in user
    @group = FactoryBot.create(:group, name: 'Food', user:)
  end

  after do
    Dealing.destroy_all
    Group.destroy_all
    User.destroy_all
  end

  scenario 'creates a new group' do
    visit new_user_group_path(user, @group)

    expect(page).to have_current_path(new_user_group_path(user, @group))
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')

    fill_in 'group_name', with: 'Food'
    fill_in 'group_icon', with: 'https://assets.materialup.com/uploads/a4d861ba-07a4-426d-b3cb-67f0353de4e1/preview.jpg'

    click_button 'Create Group'

    expect(page).to have_current_path(user_groups_path(user))
    expect(page).to have_content('Food')
    expect(page).to have_content('No dealings')

    click_link 'Food'

    expect(page).to have_current_path(user_group_path(user, @group))
  end
end
