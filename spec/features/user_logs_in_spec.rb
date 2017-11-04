require 'rails_helper'

feature 'user logs into their account' do
  let!(:user) { FactoryGirl.create(:user) }
  scenario 'inputting correct credentials' do
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'

    expect(page).to have_content('Login successful!')
    expect(page).to have_content('Logged in as '+user.name)
    expect(page).to have_content('Logout')
  end

  scenario 'inputting incorrect credentials' do
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'test'
    click_button 'Login'

    expect(page).to have_content('Invalid login credentials')
  end
end
