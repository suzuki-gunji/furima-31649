class Item < ApplicationRecord
  validates :name,             presence: true
  validates :explain,          presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :delivery_fee_id,  presence: true
  validates :prefecture_id,    presence: true
  validates :days_id,          presence: true
  validates :price,            presence: true
  validates :image,            presence: true

  has_one_attached :image
  belongs_to :user

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
