class SceneRole < ApplicationRecord
  belongs_to :role
  belongs_to :scene
  # validates :role_id, uniqueness: { scope: :scene_id, message: "role should be unique in #{scene}" }
  validates_uniqueness_of :role, scope: :scene
end
