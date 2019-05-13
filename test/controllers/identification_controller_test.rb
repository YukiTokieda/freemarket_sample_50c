require 'test_helper'

class IdentificationControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get identification_edit_url
    assert_response :success
  end

end
