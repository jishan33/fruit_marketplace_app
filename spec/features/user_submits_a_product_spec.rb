require 'rails_helper'


RSpec.feature "Farmer submits a product" do
  scenario 'they see the page for the submitted product' do
    product_title = 'fruit gift box'
    product_rank = 'A'
    product_quantity = 3
    product_description = "Freshest local fruit"
    product_price = 80
    # Our product requires a store to be valid
    user = User.create(username: 'Test user', email: 'email@domain.com', password: 'password', user_type: 'farmer')
    farmer = Farmer.create(user_id: user.id, name: "John Lu", fruit_types: "apples", introduction: "hello I am a farmer")


    visit user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log in'


    visit new_product_path
    fill_in 'product[title]', with: product_title
    fill_in 'product[rank]', with: product_rank
    fill_in 'product[quantity]', with: product_quantity
    fill_in 'product[description]', with: product_description
    fill_in 'product[price]', with: product_price
    
    
    
    click_on 'Create Product'


    save_and_open_page

    expect(page).to have_content(product_title)
  end
end