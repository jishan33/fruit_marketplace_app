class Comment < ApplicationRecord
  belongs_to :product
  has_one :user
end