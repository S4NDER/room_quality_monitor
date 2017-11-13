class Device < ApplicationRecord
  has_many :audio
  has_many :humidity
  has_many :luminosity
  has_many :temperature
end
