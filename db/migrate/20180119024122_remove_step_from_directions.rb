class RemoveStepFromDirections < ActiveRecord::Migration[5.1]
  def change
    remove_column :directions, :step, :integer
  end
end
