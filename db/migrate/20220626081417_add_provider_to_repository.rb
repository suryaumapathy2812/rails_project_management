class AddProviderToRepository < ActiveRecord::Migration[6.1]
  def change

    add_reference(:repositories, :provider, index: true)

  end
end
