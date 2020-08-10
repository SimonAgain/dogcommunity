class RenameUserTypeInUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_type, :integer
  end
end
