require 'rails_helper'

RSpec.feature 'User signs up' do
  scenario 'they can sign up for the website' do
    # Variable Setup
    user_username = 'Test User'
    user_email = 'test@test.com'
    user_password = '123456'
   

    # Instructions
    visit root_path
    click_on 'User sign up'
    fill_in 'user[username]', with: user_username
    fill_in 'user[email]', with: user_email
    fill_in 'user[password]', with: user_password
    fill_in 'user[password_confirmation]', with: user_password
    #save_and_open_page
    click_on 'Sign up'

    # Asertion
    expect(page).to have_content('You have signed up successfully.')
  end
end
