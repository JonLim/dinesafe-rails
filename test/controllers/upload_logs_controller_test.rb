require 'test_helper'

class UploadLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_logs_index_url
    assert_response :success
  end

  test "should get show" do
    get upload_logs_show_url
    assert_response :success
  end

end
