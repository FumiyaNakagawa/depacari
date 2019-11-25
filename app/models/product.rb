class Product < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :namem, presence: true, length: { maximum:50 }
end