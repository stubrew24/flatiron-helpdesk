class AddPasswordDigestToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :hashed_password
    add_column :admin_users, :password_digest, :string
  end
end
