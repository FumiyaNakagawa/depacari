# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    user_name { 'foo' }
    email { 'foo@example.com' }
    password { 'foofoo' }
    password_confirmation { 'foofoo' }
  end
end