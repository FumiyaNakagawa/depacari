# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :sold_user, class_name: 'User'

  has_many :depacari_point
  has_one :monay_transacrions

  enum payment_method: { credit_card: 1, depacari_point: 2 }
  enum status: { waiting: 0 , shipped: 1, received: 2}

  validates :payment_method, presence: true
  validates :use_depacari_point, presence: true, numericality: { only_integer: true, less_than: 100000000, greater_than_or_equal_to: 0	}
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
end