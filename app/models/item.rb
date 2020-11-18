class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase
  belongs_to :user

  with_options presence: true do
    validates :name,             length: { maximum: 40 } 
    validates :explain          
    validates :category_id      
    validates :status_id        
    validates :delivery_fee_id  
    validates :prefecture_id    
    validates :day_id          
    validates :price,            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ , message: 'には半角の数字を使用してください' }
    validates :image            
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day

  with_options numericality: { other_than: 1 } do
    validates :category_id     
    validates :status_id       
    validates :delivery_fee_id 
    validates :prefecture_id  
    validates :day_id        
  end

end
