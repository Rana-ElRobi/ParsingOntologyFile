require 'test_helper'

class KDmethodControllerTest < ActionController::TestCase
  test "should get seq_hydrophobicity" do
    get :seq_hydrophobicity
    assert_response :success
  end

end
