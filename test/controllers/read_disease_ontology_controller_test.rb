require 'test_helper'

class ReadDiseaseOntologyControllerTest < ActionController::TestCase
  test "should get is_a" do
    get :is_a
    assert_response :success
  end

end
