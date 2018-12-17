require 'test_helper'

class CdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cds_index_url
    assert_response :success
  end

end
