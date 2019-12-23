FactoryBot.define do
  factory :order do
    payment_method { 'クレジットカード' }
    use_depacari_point { 1000 }
    shipping_name { '中川' }
    shipping_address { '東京都' }
  end
end