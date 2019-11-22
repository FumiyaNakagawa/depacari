class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum:50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:255 }, format: { with: VALID_EMAIL_REGEX } , uniqueness: true
  # validates :email, presence: true, length: { maximum:255 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end