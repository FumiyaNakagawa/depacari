class Money < ApplicationRecord
  belongs_to :order

  enum status: { pay: 1, cash: 2 }
end
