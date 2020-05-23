class Message < ApplicationRecord
  belongs_to :farmer
  has_one :user
end
