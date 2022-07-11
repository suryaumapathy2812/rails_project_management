require "test_helper"

class RepositoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get repository_show_url
    assert_response :success
  end
end
