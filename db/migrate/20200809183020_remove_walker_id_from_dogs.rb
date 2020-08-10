class RemoveWalkerIdFromDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :walker_id, :integer
  end
end
