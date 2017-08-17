class AddUserToSecretCode < ActiveRecord::Migration[5.1]
  def change
    add_reference :secret_codes, :user, foreign_key: true
  end
end
