class Product < ApplicationRecord
  belongs_to :user
  has_many :products_image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum:50 }

  accepts_nested_attributes_for :products_image
end