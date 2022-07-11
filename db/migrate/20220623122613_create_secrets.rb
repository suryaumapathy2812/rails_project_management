class CreateSecrets < ActiveRecord::Migration[6.1]
  def change
    create_table :secrets do |t|

      t.references :provider, index:true, foreign_key: {to_table: :providers}
      t.references :user, index:true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
