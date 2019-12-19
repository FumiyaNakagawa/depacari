# frozen_string_literal: true

class ProductImage < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ProductImageUploader
  validate :image_size

  private

  def image_size
    errors.add(:image, 'should be less than 5MB') if image.size > 5.megabytes
  end
end
