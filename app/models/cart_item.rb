class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :customer_id, :item_id, :amount, presence: true
  validates :amount, numericality: {only_integer: true }
  has_one_attached :image
  def subtotal
    item.with_tax_price * amount
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpeg', content_type: 'image/jpeg')
    end
    image
  end
end
