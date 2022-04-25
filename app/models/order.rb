class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  validates :name, :postal_code, :address, presence: true
  enum payment_mehod: {
    クレジットカード: 0,
    銀行振込: 1
  }
  
  enum address:[:"ご自身の住所", :"登録済みの住所から選択", :"新しいお届け先"]
end
