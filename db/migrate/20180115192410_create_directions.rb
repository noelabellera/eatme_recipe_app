class CreateDirections < ActiveRecord::Migration[5.1]
  def change
    create_table :directions do |t|
      t.integer :step
      t.text :instruction
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
