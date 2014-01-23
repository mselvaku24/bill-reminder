require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.entry', 2
    assert_select '.entry h3', 2
    assert_select '.entry h3', 'Energex'
    assert_select '.entry h3', 'Origin'
  end

end
