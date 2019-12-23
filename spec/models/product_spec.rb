# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#product' do
    # 各テストの前にProductを作成
    let(:product) { build(:product, user_id: user.id) }
    let(:user) { create(:user) }
    subject { product.valid? }

    context 'validates check' do
      # 商品名、値段、商品の状態があれば有効であること
      it 'is valid with a name, price, and condition' do
        is_expected.to eq true
      end

      # 商品名がなければ無効である事
      it 'is invalid without a name' do
        product.name = nil
        is_expected.to eq false
      end
      
      # 値段がなければ無効である事
      it 'is invalid without a price' do
        product.price = nil
        is_expected.to eq false
      end

      # 商品の状態がなければ無効である事
      it 'is invalid without a condition' do
        product.condition = nil
        is_expected.to eq false
      end
    end
    
    context 'string length check' do
      let(:string) { 'a' * 256 }

      # 商品名が50文字以上あると無効である事
      it 'is invalid when there are more than 50 characters' do
        product.name = string
        is_expected.to eq false
      end

      # 商品説明が255文字以上あると無効である事
      it 'is invalid when there are more than 255 characters' do
        product.details = string
        is_expected.to eq false
      end
    end

    context 'number is less than the specified value' do
      let(:int) { 100000000 }

      # 値段が一億円以上だとあると無効である事
      it 'is invalid when the price is more than 100 million yen' do
        product.price = int
        is_expected.to eq false
      end
    end
  end
end
