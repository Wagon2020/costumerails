class CreateJoinTableSceneRoles < ActiveRecord::Migration[6.0]
  def change
    create_join_table :scenes, :roles do |t|
      # t.index [:scene_id, :role_id]
      # t.index [:role_id, :scene_id]
    end
  end
end
