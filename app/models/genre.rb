class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  validatable :name, uniqueness: true, persence: true
end
