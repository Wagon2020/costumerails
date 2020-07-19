class Role < ApplicationRecord
  belongs_to :script
  has_many :scene_roles
  has_many :scenes, through: :scene_roles
end
