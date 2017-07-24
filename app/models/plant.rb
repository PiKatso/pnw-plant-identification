class Plant < ApplicationRecord
  validates :name, :scientific_name, :plant_type, :general, :ecology, :leaves, :cones, :bark, :branches, presence: true

end
