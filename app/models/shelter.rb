class Shelter < ApplicationRecord
  validates_presence_of :name, :city, :address, :state, :zip
  has_many :pets
end
