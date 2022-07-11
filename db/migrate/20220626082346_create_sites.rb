class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.references :provider, index:true, foreign_key: {to_table: :providers}
      t.references :user, index: true, foreign_key:{ to_table: :users }

      t.timestamps
    end

    add_reference(:repositories, :created_by, index: true, foreign_key: {to_table: :users})
  end
end
