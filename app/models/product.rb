# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :product_images, dependent: :destroy

  enum status: { waiting: 0, sold: 1 }

  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 50 }
  validates :details, length: { maximum: 255 }
  validates :price, presence: true, numericality: {less_than: 100000000	}
  validates :condition, presence: true

  accepts_nested_attributes_for :product_images, allow_destroy: true
end
