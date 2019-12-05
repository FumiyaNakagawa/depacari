require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user' do
    it 'しっかり入力されている場合' do
      user = User.new( user_name: "a", email: "a@gmail.com", password: "aaaaaa", password_confirmation: "aaaaaa" )
      expect(user).to be_valid
    end

    it 'user_nameがない場合' do
      user = User.new( user_name: "", email: "a@gmail.com", password: "aaaaaa", password_confirmation: "aaaaaa" )
      expect(user).to_not be_valid
    end

    it 'emailがない場合' do
      user = User.new( user_name: "a", email: "", password: "aaaaaa", password_confirmation: "aaaaaa" )
      expect(user).to_not be_valid
    end

    it 'emailが正しい形式じゃない時' do
      user = User.new( user_name: "a", email: "aaaaaa", password: "aaaaaa", password_confirmation: "aaaaaa" )
      expect(user).to_not be_valid
    end

    it 'passwordが６文字以下の場合' do
      user = User.new( user_name: "a", email: "a@gmail.com", password: "a", password_confirmation: "a" )
      expect(user).to_not be_valid
    end

    it 'passwordとpassword_confirmationが一致しない時' do
      user = User.new( user_name: "a", email: "a@gmail.com", password: "aaaaaa", password_confirmation: "bbbbbb" )
      expect(user).to_not be_valid
    end

  end
end