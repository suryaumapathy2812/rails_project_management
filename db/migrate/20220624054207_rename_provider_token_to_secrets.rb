class RenameProviderTokenToSecrets < ActiveRecord::Migration[6.1]
  def change
    rename_table "provider_tokens",  "secrets"
  end
end
