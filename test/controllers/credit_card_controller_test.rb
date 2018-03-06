require 'test_helper'

class CreditCardControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get credit_card_create_url
    assert_response :success
  end

end
