require 'rails_helper'

RSpec.describe 'splash/index.html.erb', type: :feature do
  scenario 'shows login' do
    visit root_path
    
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Log In')
    expect(page).to have_content('Sign Up')
    
    click_link 'Log In'
    
    expect(page).to have_current_path(new_user_session_path)
    
    visit root_path
    
    click_link 'Sign Up'
    
    expect(page).to have_current_path(new_user_registration_path)

  end
end
