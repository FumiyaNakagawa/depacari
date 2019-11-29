class ProductsImage < ApplicationRecord
  belongs_to :product
  mount_uploader :productsimage, ImageUploader
  validate :image_size

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end