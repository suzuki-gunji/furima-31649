FactoryBot.define do
  factory :item_purchase do
    postal_code {'200-2222'}
    prefecture_id {2}
    city {'新宿区'}
    building {'新宿ハイツ'}
    house_number {'2-2-2'}
    phone_number {'08000000000'}
    token {"tok_abcdefghijk00000000000000000"}
    user_id{1}
    item_id{1}
  end
end
