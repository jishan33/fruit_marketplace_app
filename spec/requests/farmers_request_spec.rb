require 'rails_helper'

RSpec.describe "Farmers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/farmers/index"
      expect(response).to have_http_status(:success)
    end
  end

end
