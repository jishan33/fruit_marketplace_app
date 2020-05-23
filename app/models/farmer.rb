class Farmer < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :farm_locations, dependent: :destroy

  belongs_to :user
  has_one_attached :picture

  validates :name, presence: true, length: { in: 1...20 }
  validates :address, presence: true, length: { in: 12...50 }
  validates :fruit_types, presence: true, length: { in: 5...50 }
  validates :introduction, presence: true, length: { in: 10...100 }
end
