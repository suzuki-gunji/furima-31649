class ItemPurchase
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :building, :house_number, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "が間違っています (-)が必要です"}
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number,format: {with: /\A\d{10}$|^\d{11}\z/, message: "が間違っています"}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id, user_id: user_id)
  end

end 


