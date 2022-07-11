class RepositoryController < ApplicationController

  def show
  end

  def create
    new_repo = create_repository(repo_params["name"])
    @repo = Repository.new({:project_id => repo_params["project_id"] ,:name => new_repo["name"], :path => new_repo["full_name"]})
    puts @repo.to_s
    if  @repo.save
      puts "Success"
    else
      puts "failed"
      puts @repo.errors.full_messages
    end

  end

  def list
    # list_repositories()
  end


  private
  def repo_params
    params.require(:repository).permit(:project_id, :name)
  end

end
