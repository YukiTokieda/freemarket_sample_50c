require 'test_helper'

class LogoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logout_index_url
    assert_response :success
  end

end
