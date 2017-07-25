class Plant < ApplicationRecord
  include Filterable

  validates :name, :scientific_name, :plant_type, :general, :ecology, :leaves, :cones, :bark, :branches, presence: true

  # Scopes
  # scope :search_all, -> params { where leaves: params[:leaves], cones: params[:cones], bark: params[:bark], branches: params[:branches] }

  scope :s_b_leaves, -> (leaves) { where leaves: leaves }
  scope :s_b_cones, -> (cones) { where cones: cones}
  scope :s_b_bark, -> (bark) { where bark: bark }
  scope :s_b_branches, -> (branches) { where branches: branches }

  # Scope for Name Likeness
  scope :s_b_name, -> (name) { where("name like ?", "#{name}%")}
end
