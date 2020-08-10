class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_type
      t.text :email
      t.text :password
      t.string :phone_no
      t.text :address
      t.text :image

      t.timestamps
    end
  end
end
