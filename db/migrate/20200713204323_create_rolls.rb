class CreateRolls < ActiveRecord::Migration[6.0]
  def change
    create_table :rolls do |t|
      t.string :name
      t.integer :number
      t.text :notes
      t.string :connection
      t.references :scene, null: false, foreign_key: true

      t.timestamps
    end
  end
end
