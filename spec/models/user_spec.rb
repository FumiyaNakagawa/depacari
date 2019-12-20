# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user' do
    # 各テストの前にUserを作成
    # let(:user) { User.new(params) }
    # let(:params) { { user_name: 'a', email: 'a@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' } }

    # let(:user) { build(:user, user_name: 'a', email: 'a@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa') }

    let(:user) { build(:user_a) }

    before do
      # User.create(
      #   user_name: 'test',
      #   email: 'test@example.com',
      #   password: 'aaaaaa',
      #   password_confirmation: 'aaaaaa'
      # )
      create(:user)
    end

    context 'validates check' do
      # 名前、メールアドレス、パスワードがあれば有効であること
      it 'is valid with a user_name, email, password, and password_confirmtion' do
        expect(user).to be_valid
      end

      # 名前がなければ無効である事
      it 'is invalid without a user_name' do
        user.user_name = nil
        expect(user).to be_invalid
      end

      # 名前が重複している場合は無効であること
      it 'is invalid with a deplicate emaill address' do
        user.user_name = 'test'
        expect(user).to be_invalid
      end

      # メールアドレスがなければ無効である事
      it 'is invalid without a email' do
        user.email = 'nil'
        expect(user).to be_invalid
      end

      # メールアドレスが正しい形式じゃない時無効である事
      it 'is invalid when email is not in the correct format' do
        user.email = 'a'
        expect(user).to be_invalid
      end

      # メールアドレスが重複している場合は無効であること
      it 'is invalid with a deplicate emaill address' do
        user.email = 'test@example.com'
        expect(user).to be_invalid
      end
    end

    context 'password check' do
      let(:password) { 'a' }
      let(:password1) { 'aaaaaa' }
      let(:password2) { 'bbbbbb' }

      # パスワードが６文字以下の場合
      it 'is invalid when the password is 6 characters or less' do
        user.password = password
        user.password_confirmation = password
        expect(user).to be_invalid
      end

      it 'passwordとpassword_confirmationが一致しているときパターン１' do
        user.password = password1
        user.password_confirmation = password1
        expect(user).to be_valid
      end

      it 'passwordとpassword_confirmationが一致しているときパターン２' do
        user.password = password2
        user.password_confirmation = password2
        expect(user).to be_valid
      end

      it 'passwordとpassword_confirmationが一致しない時' do
        user.password = password1
        user.password_confirmation = password2
        expect(user).to be_invalid
      end
    end
  end
end
