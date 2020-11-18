class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items  
  has_many :purchases  
  has_many :address 

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  validates :nickname, presence: true, length: { maximum: 40 } 
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'には全角文字を使用してください' } do
    validates :last_name, presence: true       
    validates :first_name, presence: true  
  end       
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角のカタカナを使用してください' } do
    validates :last_reading, presence: true       
    validates :first_reading, presence: true
  end          
  validates :birthday, presence: true       

end
