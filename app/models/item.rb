class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  validates :name,             presence: true, length: { maximum: 40 } 
  validates :explain,          presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :delivery_fee_id,  presence: true
  validates :prefecture_id,    presence: true
  validates :days_id,          presence: true

  validates :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ , message: 'には半角の数字を使用してください' }
  validates :image,            presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day

  validates :category_id,     numericality: { other_than: 1 }
  validates :status_id,       numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id,   numericality: { other_than: 1 }
  validates :days_id,         numericality: { other_than: 1 }


end
