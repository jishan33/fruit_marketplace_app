class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :farmer, dependent: :destroy
  has_one :cart, dependent: :destroy
  enum user_type: {normal: 0, farmer: 1}

  validates :username, presence: true, length: {in: 3..15}

  accepts_nested_attributes_for :farmer

  def with_farmer
    build_farmer if farmer.nil?
    self
  end
  
end
