class AddRolesMaskToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roles_mask, :integer
  end

  #admin role
  # u= User.find_by(email: 'admin@example.com')
  # u.update(roles_mask: 1)
end
