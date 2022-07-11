class AddSecretsFields < ActiveRecord::Migration[6.1]
  def change

    add_column :secrets, :token, :string, :after => "user_id"
    add_column :secrets, :client_id, :string, :after => "token"
    add_column :secrets, :client_secret, :string, :after => "client_id"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

  end
end
