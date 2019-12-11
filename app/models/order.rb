# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :sold_user, class_name: "User"


  enum status: { waiting: 0 }
end
