class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  validates :name, :postal_code, :address, presence: true
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  enum address_option:[:"ご自身の住所", :"登録済みの住所から選択", :"新しいお届け先"]
  def ship_cost
    self.shipping_cost = 800
  end
end
