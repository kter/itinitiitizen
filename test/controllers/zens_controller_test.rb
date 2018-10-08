require 'test_helper'

class ZensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zen = zens(:one)
  end

  test "should get index" do
    get zens_url
    assert_response :success
  end

  test "should get new" do
    get new_zen_url
    assert_response :success
  end

  test "should create zen" do
    assert_difference('Zen.count') do
      post zens_url, params: { zen: { content: @zen.content, deleted: @zen.deleted } }
    end

    assert_redirected_to zen_url(Zen.last)
  end

  test "should show zen" do
    get zen_url(@zen)
    assert_response :success
  end

  test "should get edit" do
    get edit_zen_url(@zen)
    assert_response :success
  end

  test "should update zen" do
    patch zen_url(@zen), params: { zen: { content: @zen.content, deleted: @zen.deleted } }
    assert_redirected_to zen_url(@zen)
  end

  test "should destroy zen" do
    assert_difference('Zen.count', -1) do
      delete zen_url(@zen)
    end

    assert_redirected_to zens_url
  end
end
