require 'test_helper'

class CreditcardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creditcard_index_url
    assert_response :success
  end

end
