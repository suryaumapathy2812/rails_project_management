class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|

      t.references :project, index:true, foreign_key: {to_table: :projects}
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
