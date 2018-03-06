require 'test_helper'

class BoletoControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get boleto_create_url
    assert_response :success
  end

end
