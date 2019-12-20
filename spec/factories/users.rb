# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    user_name { 'test' }
    email { 'test@example.com' }
    password { 'aaaaaa' }
    password_confirmation { 'aaaaaa' }
  end

  factory :user_a, class: User do
    user_name { 'a' }
    email { 'a@gmail.com' }
    password { 'aaaaaa' }
    password_confirmation { 'aaaaaa' }
  end
end