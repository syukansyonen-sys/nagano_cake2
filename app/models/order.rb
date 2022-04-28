class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  validates :name, :postal_code, :address, presence: true
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  enum status: { "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4 }

  enum address_option:[:"ご自身の住所", :"登録済みの住所から選択", :"新しいお届け先"]
  def ship_cost
    self.shipping_cost = 800
  end
  class << self
    def localed_statuses
      statuses.keys.map do |s|
        [ApplicationController.helpers.t("status.article.#{s}"), s]
      end
    end
  end

end
