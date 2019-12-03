class ProductImage < ApplicationRecord
  belongs_to :product
  mount_uploader :product_image, ProductImageUploader
  # validate :image_size

  private

  # def image_size
  #   if products_image.size > 5.megabytes
  #     errors.add(:image, "should be less than 5MB")
  #   end
  # end
end
