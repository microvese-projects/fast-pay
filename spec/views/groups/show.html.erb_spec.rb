require 'rails_helper'

RSpec.describe 'groups/show', type: :feature do
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

  scenario 'shows details of a group' do
    visit user_group_path(user, @group)

    expect(page).to have_current_path(user_group_path(user, @group))
    expect(page).to have_content('Details')
    expect(page).to have_content('New Dealing')
    expect(page).to have_selector('img')

    click_link 'New Dealing'

    expect(page).to have_current_path(new_user_group_dealing_path(user, @group))
    expect(page).to have_content('New Dealing')
  end
end
