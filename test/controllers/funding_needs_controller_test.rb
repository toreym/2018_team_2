require 'test_helper'

class FundingNeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funding_need = funding_needs(:one)
  end

  test "should get index" do
    get funding_needs_url
    assert_response :success
  end

  test "should get new" do
    get new_funding_need_url
    assert_response :success
  end

  test "should create funding_need" do
    assert_difference('FundingNeed.count') do
      post funding_needs_url, params: { funding_need: {  } }
    end

    assert_redirected_to funding_need_url(FundingNeed.last)
  end

  test "should show funding_need" do
    get funding_need_url(@funding_need)
    assert_response :success
  end

  test "should get edit" do
    get edit_funding_need_url(@funding_need)
    assert_response :success
  end

  test "should update funding_need" do
    patch funding_need_url(@funding_need), params: { funding_need: {  } }
    assert_redirected_to funding_need_url(@funding_need)
  end

  test "should destroy funding_need" do
    assert_difference('FundingNeed.count', -1) do
      delete funding_need_url(@funding_need)
    end

    assert_redirected_to funding_needs_url
  end
end
