module FarmersHelper
  def farmer_pic(farmer)
    if farmer.picture.present?
      farmer.picture
    else
      'farmer_default.jpg'
    end
  end
end
