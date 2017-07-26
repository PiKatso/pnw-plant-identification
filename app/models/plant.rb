class Plant < ApplicationRecord
  include Filterable

  validates :name, :scientific_name, :plant_type, :general, :ecology, :leaves, :cones, :bark, :branches, presence: true

  # Scopes
  scope :s_b_leaves, -> (leaves) { where leaves: leaves }
  scope :s_b_cones, -> (cones, leaves) { where cones: cones, leaves: leaves }
  scope :s_b_bark, -> (bark, leaves, cones) { where bark: bark, leaves: leaves, cones: cones }

  scope :s_b_branches, -> (branches) { where branches: branches }

  scope :search_all, -> (leaves, cones, bark, branches) { where leaves: leaves, cones: cones, bark: bark, branches: branches }
  # Scope for Name Likeness
  scope :s_b_name, -> (name) { where("name like ?", "#{name}%")}
end
