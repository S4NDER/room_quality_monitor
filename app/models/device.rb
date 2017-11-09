class Device < ApplicationRecord
  belongs_to :audio
  belongs_to :humidity
  belongs_to :luminosity
  belongs_to :temperature
end
