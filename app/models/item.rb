class Item < ApplicationRecord
  has_one_attached :image
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: {only_integer: true }
  validates :genre_id, presence: true
end
