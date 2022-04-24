class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, uniqueness: true, persence: true
end
