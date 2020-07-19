class DeleteJoinTableSceneRoles < ActiveRecord::Migration[6.0]
  def change
    drop_table :roles_scenes
  end
end
