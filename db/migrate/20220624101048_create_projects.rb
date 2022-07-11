class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :user, index:true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
