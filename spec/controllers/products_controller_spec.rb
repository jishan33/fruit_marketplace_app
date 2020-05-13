require 'rails_helper'

RSpec.describe ProductsController do

  let(:user) {
   User.create(email: "user@example.org", password: "very-secret", user_type: "farmer")
   }
  let(:farmer) {
   Farmer.create(user_id: user.id, name: "John Lu", address: "farmer address", fruit_types: "apples", introduction: "hello I am a farmer")
   }


end