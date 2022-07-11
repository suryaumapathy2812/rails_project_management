require "uri"
require "json"
require "net/http"


module SitesHelper

  def  create_site (name, provider, repo_path, private=false, branch="main")
    url = URI("https://api.netlify.com/api/v1/sites")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)

    # request["Accept"] = "application/vnd.github.v3+json"
    request["Authorization"] = "Bearer #{get_user_token}"
    request["Content-Type"] = "application/json"

    request.body = JSON.dump(
      {
          name: name,
          repo: {
            repo: repo_path,
            private: private,
            branch: branch,
          }
      })

    response = https.request(request)
    puts JSON.parse(response.read_body)
    JSON.parse(response.read_body)
  end


  private   # This is a private method

  def get_user_token
    provider = Provider.find_by(:name => "Netlify")
    token = Secret.find_by({ :provider_id => provider.id, :user_id => current_user.id })
    return token.token
  end

end
