class RemoveAmountFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :amount, :float
  end
end
