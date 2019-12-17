# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :sold_user, class_name: 'User'

  has_many :depacari_point
  has_one :money

  enum status: { waiting: 0 }

  validates :payment_method, presence: true
  validates :user_depacari_point, presence: true, length: { maximum: 20 }
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
end
