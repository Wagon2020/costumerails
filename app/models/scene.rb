class Scene < ApplicationRecord
  # belongs_to :script
  has_rich_text :body
  has_many :scene_roles
  has_many :roles, through: :scene_roles
end
