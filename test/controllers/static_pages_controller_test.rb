require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_url
    assert_response :success
  end

  test "should get alternatives" do
    get alternatives_url
    assert_response :success
  end

  test "should get issues" do
    get issues_url
    assert_response :success
  end

end
