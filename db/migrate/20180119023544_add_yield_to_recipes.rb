class AddYieldToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :yield, :string
  end
end
