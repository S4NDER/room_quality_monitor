class Device < ApplicationRecord
  has_many :audios
  has_many :humidities
  has_many :luminosities
  has_many :temperatures
  has_many :barometers
  belongs_to :rooms
end
