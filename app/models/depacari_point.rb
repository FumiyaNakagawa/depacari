# frozen_string_literal: true

class DepacariPoint < ApplicationRecord
  belongs_to :order

  enum status: { buy: 1, sell: 2, cash: 3 }
end
