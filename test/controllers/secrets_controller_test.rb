require "test_helper"

class SecretsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get secrets_edit_url
    assert_response :success
  end
end
