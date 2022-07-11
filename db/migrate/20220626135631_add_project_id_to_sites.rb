class AddProjectIdToSites < ActiveRecord::Migration[6.1]
  def change
    add_reference(:sites, :project, index:true)
  end
end
