class Farmer < ApplicationRecord
  has_many :products, dependent: :destroy
  bleongs_to :user
end
