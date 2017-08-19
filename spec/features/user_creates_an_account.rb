require 'rails_helper'

feature 'user creates an account' do
  scenario 'inputting good credentials' do
    visit signup_path

    fill_in 'Name', with: 'Test Testerson'
    fill_in 'Email', with: 'test@test.test'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign Up'

    expect(page).to have_content('Account creation successful!')
    expect(page).to have_content('Logged in as Test Testerson')
    expect(page).to have_content('Logout')
    puts 'in here'
  end

  scenario 'inputting passwords that do not match' do
    visit signup_path

    fill_in 'Name', with: 'Test Testerson'
    fill_in 'Email', with: 'test@test.test'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'test'
    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'inputting invalid credentials' do
    visit signup_path

    click_button 'Sign Up'

    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
  end
end
