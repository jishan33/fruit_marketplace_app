class Farmer < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  has_one_attached :picture
end
