# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :sold_user, class_name: 'User'

  has_many :depacari_point
  has_one :monay_transacrions

  enum status: { waiting: 0 }

  validates :payment_method, presence: true, inclusion: { in: %w[クレジットカード depacariポイントで購入] }
  validates :use_depacari_point, presence: true, numericality: {less_than: 100000000	}
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
end
