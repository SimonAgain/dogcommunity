class CreateDogsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs_users do |t|
      t.integer :dog_id
      t.integer :user_id
    end
  end
end
