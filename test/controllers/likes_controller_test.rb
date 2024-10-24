require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get likes_user:references_url
    assert_response :success
  end

  test "should get post:references" do
    get likes_post:references_url
    assert_response :success
  end
end
