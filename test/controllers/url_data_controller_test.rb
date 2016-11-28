require 'test_helper'

class UrlDataControllerTest < ActionController::TestCase
  setup do
    @url_datum = url_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_data)
  end

  test "should create url_datum" do
    assert_difference('UrlDatum.count') do
      post :create, url_datum: { hits: @url_datum.hits, long_url: @url_datum.long_url, short_url: @url_datum.short_url }
    end

    assert_response 201
  end

  test "should show url_datum" do
    get :show, id: @url_datum
    assert_response :success
  end

  test "should update url_datum" do
    put :update, id: @url_datum, url_datum: { hits: @url_datum.hits, long_url: @url_datum.long_url, short_url: @url_datum.short_url }
    assert_response 204
  end

  test "should destroy url_datum" do
    assert_difference('UrlDatum.count', -1) do
      delete :destroy, id: @url_datum
    end

    assert_response 204
  end
end
