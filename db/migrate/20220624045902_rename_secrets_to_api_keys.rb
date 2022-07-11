class RenameSecretsToApiKeys < ActiveRecord::Migration[6.1]
  def change
    rename_table "secrets", "provider_tokens"
  end
end
