class Product < ApplicationRecord
  belongs_to :farmer
  has_one_attached :picture

  validates :title, presence: true, length: {in: 1...20}
  validates :rank, presence: true, length: {in: 1..2}
  validates :description, presence: true, length: {in: 1...50}
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 10 }
  validates :farmer_id, presence: true

  def display_currency
    '$' + sprintf('%.2f', (self.price).to_s)
  end
  
end
