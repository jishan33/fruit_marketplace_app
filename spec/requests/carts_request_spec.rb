require 'rails_helper'

RSpec.describe "Carts", type: :request do



  describe "GET /index" do
    it "returns http success" do
      user = User.create(username: 'Test user', email: 'email@domain.com', password: 'password', user_type: 'normal')
      Cart.create(completed: false, user_id: user.id)

      sign_in(user)

      get "/carts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
