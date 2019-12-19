# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user' do
    # 名前、メールアドレス、パスワードがあれば有効であること
    it 'is valid with a user_name, email, password, and password_confirmtion' do
      @user = User.new(
        user_name: 'a',
        email: 'a@gmail.com',
        password: 'aaaaaa',
        password_confirmation: 'aaaaaa'
      )
      expect(@user).to be_valid
    end

    # 名前がなければ無効である事
    it 'is invalid without a user_name' do
      @user = User.new(user_name: nil)
      expect(@user).to be_invalid
    end

    # 名前が重複している場合は無効であること
    it 'is invalid with a deplicate emaill address' do
      User.create(
        user_name: 'b',
        email: 'a@gmail.com',
        password: 'aaaaaa',
        password_confirmation: 'aaaaaa'
      )

      @user = User.new(
        user_name: 'b',
        email: 'b@gmail.com',
        password: 'aaaaaa',
        password_confirmation: 'aaaaaa'
      )

      expect(@user).to be_invalid
    end

    # メールアドレスがなければ無効である事
    it 'is invalid without a email' do
      @user = User.new(email: nil)
      expect(@user).to be_invalid
    end

    # メールアドレスが正しい形式じゃない時無効である事
    it 'is invalid when email is not in the correct format' do
      @user = User.new(email: "a")
      expect(@user).to be_invalid
    end

    # メールアドレスが重複している場合は無効であること
    it 'is invalid with a deplicate emaill address' do
      User.create(
        user_name: 'a',
        email: 'a@gmail.com',
        password: 'aaaaaa',
        password_confirmation: 'aaaaaa'
      )

      @user = User.new(
        user_name: 'b',
        email: 'a@gmail.com',
        password: 'aaaaaa',
        password_confirmation: 'aaaaaa'
      )

      expect(@user).to be_invalid
    end

    # パスワードが６文字以下の場合
    it 'is invalid when the password is 6 characters or less' do
      @user = User.new(
        password: 'a',
        password_confirmation: 'a'
      )
      expect(@user).to_not be_valid
    end

    it 'passwordとpassword_confirmationが一致しない時' do
      @user = User.new(
        password: 'aaaaaa',
        password_confirmation: 'bbbbbb'
      )
      expect(@user).to be_invalid
    end
  end
end
