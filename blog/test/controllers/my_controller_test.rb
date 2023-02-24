require "test_helper"

class MyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_index_url
    assert_response :success
  end
end
