class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  validates :name, :postal_code, :address, presence: true
end
