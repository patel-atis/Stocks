require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get alternatives" do
    get static_pages_alternatives_url
    assert_response :success
  end

  test "should get issues" do
    get static_pages_issues_url
    assert_response :success
  end

end
