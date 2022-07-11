class AddSecretUnique < ActiveRecord::Migration[6.1]
  def change

    add_index :secrets, [:provider_id, :user_id], unique: true

  end
end
