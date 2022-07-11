class ProjectsController < ApplicationController

  def show
    list_repositories
    @project = Project.find(params[:project_id])

    @repository = @project.repository
    @site = Site.new(:project_id => @project.id) if @project.site.nil?

    puts @project.to_s
  end

  def index
    @project = Project.new
    @projects = Project.all.where({:user_id => current_user.id})
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :user_id)
  end

end
