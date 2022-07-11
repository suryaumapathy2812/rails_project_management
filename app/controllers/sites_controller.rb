class SitesController < ApplicationController
  include SitesHelper

  def create
    p = site_params
    puts p
    site =  create_site(p[:name], p[:provider_id], p[:repo_path] )

    @new_site = Site.new({:name => p[:name], :provider_id => p[:provider_id],:user_id => current_user.id, :url => site["default_domain"], :project_id => params[:project_id] })

    if @new_site.save
      render plain: "success"
    else
      puts @new_site.errors.full_messages
      render plain: "failed"
    end

  end


  private

  def site_params
    params.require(:site).permit(:name, :provider_id, :project_id, :repo_path )
  end

end
