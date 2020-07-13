class RenameRollsToRoles < ActiveRecord::Migration[6.0]
  def change
    rename_table('rolls', 'roles')
  end
end
