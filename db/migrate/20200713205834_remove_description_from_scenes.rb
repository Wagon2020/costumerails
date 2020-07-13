class RemoveDescriptionFromScenes < ActiveRecord::Migration[6.0]
  def change
    remove_column(:scenes, :description)
  end
end
