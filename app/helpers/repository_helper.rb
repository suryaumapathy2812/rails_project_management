require "uri"
require "json"
require "net/http"


module RepositoryHelper


  def create_repository (repo_name)
    url = URI("https://api.github.com/user/repos")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)

    request["Accept"] = "application/vnd.github.v3+json"
    request["Authorization"] = "Bearer #{get_user_token}"
    request["Content-Type"] = "application/json"

    request.body = JSON.dump({
      "name": repo_name,
      "private": false
    })

    response = https.request(request)
    puts JSON.parse(response.read_body)
    return JSON.parse(response.read_body)
  end


  def list_repositories
    url = URI("https://api.github.com/user/repos")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/vnd.github.v3+json"
    request["Authorization"] = "Bearer #{get_user_token}"
    request["Content-Type"] = "application/json"
    response = https.request(request)
    # puts JSON.parse(response.read_body).first["owner"]["repos_url"]
    # puts JSON.parse(response.read_body)[0]["name"]
    return JSON.parse(response.read_body)
  end



  private   # This is a private method

  def get_user_token
    provider = Provider.find_by(:name => "Github")
    token = Secret.find_by({ :provider_id => provider.id, :user_id => current_user.id })
    return token.token
  end

end
