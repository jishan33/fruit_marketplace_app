require 'rails_helper'

RSpec.describe ProductsController do

  let(:user) {
   User.create(email: "user@example.org", password: "very-secret", user_type: "farmer")
   }
  let(:farmer) {
   Farmer.create(user_id: user.id, name: "John Lu", address: "farmer address", fruit_types: "apples", introduction: "hello I am a farmer")
   }

  let(:product) {
    Product.create( 
      title: 'Fruit Box',
      rank: 'A',
      description: 'Sweet and Tasty',
      quantity: 3,
      price: 100,
      farmer_id: farmer.id
      )
  }

  context '#index' do 

    it 'renders the inde template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @products' do
      get :index
      expect(assigns(:products)) == ([product])
    end
  end

  context '#create' do
    it 're-renders the form when the title is invalid' do 
      sign_in(user)
      post :create, params: {product: {title: nil}}
    expect(response).to render_template(:new)
    end
  end 

  context '#update' do 
    it 're-renders the form when the id is invalid' do
      sign_in(user)
      put :update, params: { id: product.id, product: {title:nil}}
      expect(response).to render_template(:edit)
    end
  end

  context '#edit' do
    it 'renders the edit form' do
      sign_in(user)
      get :edit, params: {id: product.id}
      expect(response).to render_template(:edit)
    end

    it 'assign @product' do
      expect(assigns(:products)) == ([product])
    end
  end

end