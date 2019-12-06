class Product < ApplicationRecord
  belongs_to :user
  has_one :order

  has_many :product_images, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum:50 }
  validates :details, length: { maximum:255 }
  validates :price, presence: true, length: { maximum:20 }
  validates :condition, presence: true

  accepts_nested_attributes_for :product_images, allow_destroy: true
end