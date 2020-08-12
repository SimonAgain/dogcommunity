class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.text :bio
      t.integer :owner_id
      t.integer :walker_id

      t.timestamps
    end
  end
end
