class Product < ApplicationRecord
  belongs_to :farmer
  has_one_attached :picture
end
