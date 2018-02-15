require 'test_helper'

class ConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get conditions_show_url
    assert_response :success
  end

end
