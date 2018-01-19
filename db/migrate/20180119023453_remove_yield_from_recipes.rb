class RemoveYieldFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :yield, :float
  end
end
