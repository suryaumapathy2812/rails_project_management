class AddProviders < ActiveRecord::Migration[6.1]
  def change

    Provider.create :name => "GitHub"
    Provider.create :name => "Sonar Cloud"
    Provider.create :name => "Netlify"

  end
end
