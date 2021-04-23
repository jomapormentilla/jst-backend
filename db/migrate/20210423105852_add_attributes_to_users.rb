class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :account_type, :string
    add_column :users, :status, :string
  end
end
