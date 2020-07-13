class AddReferenceToRoles < ActiveRecord::Migration[6.0]
  def change
    add_reference(:roles, :script, foreign_key: true)
  end
end
