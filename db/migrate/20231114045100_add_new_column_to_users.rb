class AddNewColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string, default: ""
    add_column :users, :birthday, :string, default: ""
    add_column :users, :gender, :string, default: ""
    add_column :users, :profile, :string, default: ""
    add_column :users, :avatar, :string, default: ""
  end
end
