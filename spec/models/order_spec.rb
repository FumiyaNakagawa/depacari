# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#order' do
    # 各テストの前にOrderを作成
    let(:order) { build(:order, user_id: user.id, sold_user_id: product.user_id, product_id: product.id) }
    let(:user) { create(:user) }
    let(:sold_user) { create(:user, user_name: 'sold_user', email: 'sold_user@example.com') }
    let(:product) { create(:product, user_id: sold_user.id) }

    context 'validates check' do
      # 支払い方法、使用depacariポイント、氏名、住所があれば有効であること
      it 'is valid with a payment_method, use_depacari_point, shipping_name, and shipping_address' do
        expect(order).to be_valid
      end

      # 支払い方法がなければ無効である事
      it 'is invalid without a payment_method' do
        order.payment_method = nil
        expect(order).to be_invalid
      end

      # 支払い方法がクレジットカード、depacariポイントで購入でなければ無効である事
      it 'is invalid without a payment_method' do
        order.payment_method = "現金"
        expect(order).to be_invalid
      end

      # 使用depacariポイントがなければ無効である事
      it 'is invalid without a use_depacari_point' do
        order.use_depacari_point = nil
        expect(order).to be_invalid
      end

      # 氏名がなければ無効である事
      it 'is invalid without a shipping_name' do
        order.shipping_name = nil
        expect(order).to be_invalid
      end

      # 住所がなければ無効である事
      it 'is invalid without a shipping_address' do
        order.shipping_address = nil
        expect(order).to be_invalid
      end

      # 使用depacariポイントが一億ポイント以上だとあると無効である事
      it 'is invalid when the price is more than 100 million point' do
        order.use_depacari_point = 100000000
        expect(order).to be_invalid
      end
    end
  end
end
