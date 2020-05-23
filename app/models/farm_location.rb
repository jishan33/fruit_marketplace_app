class FarmLocation < ApplicationRecord
  belongs_to :farmer
  geocoded_by :address
  after_validation :geocode
end
