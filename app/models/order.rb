# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :sold_user, class_name: "User"

  has_many :depacari_point
  has_one :money

  enum status: { waiting: 0 }
end
