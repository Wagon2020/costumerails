class RemoveReferenceFromRolls < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:rolls, :scene, foreign_key: true)
  end
end
