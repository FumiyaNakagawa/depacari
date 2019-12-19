require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#product' do
    # 各テストの前にProductを作成
    let(:product) { Product.new(params) }
    let(:params) { { user_id: 1, name: '電子レンジ', price: 1000, condition: '新品、未使用' } }

    before do
      User.create(
        user_name: 'test',
        email: 'test@example.com',
        password: 'aaaaaa',
        password_confirmation: 'aaaaaa'
      )
    end

    context 'validates check' do
      # 商品名、値段、商品の状態があれば有効であること
      it 'is valid with a name, price, and condition' do
        expect(product).to be_valid
      end

      # 名前がなければ無効である事
      it 'is invalid without a user_name' do
        # user.user_name = nil
        # expect(user).to be_valid
      end

    end

  end
end
