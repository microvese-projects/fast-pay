require 'rails_helper'

RSpec.describe 'groups/index', type: :feature do
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

  scenario 'shows a list of groups' do
    visit user_groups_path(user, @group)

    expect(page).to have_current_path(user_groups_path(user, @group))
    expect(page).to have_content('Food')
    expect(page).to have_content('New group')
    
    click_link 'New group'
    
    expect(page).to have_current_path(new_user_group_path(user))
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
  end
end
