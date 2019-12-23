# frozen_string_literal: true

class MonayTransacrion < ApplicationRecord
  belongs_to :order

  enum status: { pay: 1, cash: 2 }
end
