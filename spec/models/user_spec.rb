# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    # 各テストの前にUserを作成
    let(:user) { build(:user) }
    subject { user.valid? }

    context 'validates check' do
      # 名前、メールアドレス、パスワードがあれば有効であること
      it 'is valid with a user_name, email, password, and password_confirmtion' do
        is_expected.to eq true
      end

      # 名前がなければ無効である事
      it 'is invalid without a user_name' do
        user.user_name = nil
        is_expected.to eq false
      end

      # メールアドレスがなければ無効である事
      it 'is invalid without a email' do
        user.email = 'nil'
        is_expected.to eq false
      end

      # メールアドレスが正しい形式じゃない時無効である事
      it 'is invalid when email is not in the correct format' do
        user.email = 'a'
        is_expected.to eq false
      end
    end

    context 'deplicate check' do
      before do
        create(:user, user_name: 'test', email: 'test@example.com')
      end

      # 名前が重複している場合は無効であること
      it 'is invalid with a deplicate emaill address' do
        user.user_name = 'test'
        is_expected.to eq false
      end

      # メールアドレスが重複している場合は無効であること
      it 'is invalid with a deplicate emaill address' do
        user.email = 'test@example.com'
        is_expected.to eq false
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
        is_expected.to eq false
      end

      it 'passwordとpassword_confirmationが一致しているときパターン１' do
        user.password = password1
        user.password_confirmation = password1
        is_expected.to eq true
      end

      it 'passwordとpassword_confirmationが一致しているときパターン２' do
        user.password = password2
        user.password_confirmation = password2
        is_expected.to eq true
      end

      it 'passwordとpassword_confirmationが一致しない時' do
        user.password = password1
        user.password_confirmation = password2
        is_expected.to eq false
      end
    end
  end
end
