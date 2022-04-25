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

  def add_tax_price
        (self.price * 1.10).round
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
