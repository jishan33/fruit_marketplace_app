module ProductsHelper
  def picture_for(product)
    if product.picture.present?
      product.picture
    else
      'fruit_default.jpg'
    end
  end
end
