class Device < ApplicationRecord
  has_many :audios
  has_many :humidities
  has_many :luminosities
  has_many :temperatures
  belongs_to :rooms
end
