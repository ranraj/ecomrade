require "test_helper"

class ProductwatchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productwatcher = productwatchers(:one)
  end

  test "should get index" do
    get productwatchers_url
    assert_response :success
  end

  test "should get new" do
    get new_productwatcher_url
    assert_response :success
  end

  test "should create productwatcher" do
    assert_difference("Productwatcher.count") do
      post productwatchers_url, params: { productwatcher: { status: @productwatcher.status } }
    end

    assert_redirected_to productwatcher_url(Productwatcher.last)
  end

  test "should show productwatcher" do
    get productwatcher_url(@productwatcher)
    assert_response :success
  end

  test "should get edit" do
    get edit_productwatcher_url(@productwatcher)
    assert_response :success
  end

  test "should update productwatcher" do
    patch productwatcher_url(@productwatcher), params: { productwatcher: { status: @productwatcher.status } }
    assert_redirected_to productwatcher_url(@productwatcher)
  end

  test "should destroy productwatcher" do
    assert_difference("Productwatcher.count", -1) do
      delete productwatcher_url(@productwatcher)
    end

    assert_redirected_to productwatchers_url
  end
end
