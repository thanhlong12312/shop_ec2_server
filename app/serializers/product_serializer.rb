class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :description, :sale, :number_favorites, :product_iamges, :category_id, :shop_id, :shop_info, :number_product,
              :number_sell, :lat, :long

  has_many :product_iamges

  def product_iamges
  	list_images = []
  	images = ProductImage.where(:product_id => object.id)
  	if images
	  	images.each do |v|
	  		list_images << v.content_image.url(:medium)
	  	end
  	end
  	list_images
  end

  def shop_info
    object.shop
  end

  def lat
    object.user.profile.lat
  end

  def long
    object.user.profile.long
  end
end