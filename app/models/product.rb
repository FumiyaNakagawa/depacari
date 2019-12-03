class Product < ApplicationRecord
  belongs_to :user
  has_many :product_images
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum:50 }

  accepts_nested_attributes_for :product_images, allow_destroy: true
end