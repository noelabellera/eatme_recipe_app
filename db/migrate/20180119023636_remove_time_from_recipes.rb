class RemoveTimeFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :time, :float
  end
end
