class RemoveDuplicateColumns < ActiveRecord::Migration[6.1]
  def change


    remove_column(:repositories, :user_id)
    rename_column(:repositories, "url", "path")
    rename_column(:repositories, "created_by_id", "created_by")
    rename_column(:sites, :user_id, "created_by")

  end
end
