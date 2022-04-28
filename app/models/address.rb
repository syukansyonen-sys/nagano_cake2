class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, :address, :name, presence: true
  
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
