require File.dirname(__FILE__) + '/../test_helper'

class TripsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_trip
    assert_difference('Trip.count') do
      post :create, :trip => { }
    end

    assert_redirected_to trip_path(assigns(:trip))
  end

  def test_should_show_trip
    get :show, :id => trips(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => trips(:one).id
    assert_response :success
  end

  def test_should_update_trip
    put :update, :id => trips(:one).id, :trip => { }
    assert_redirected_to trip_path(assigns(:trip))
  end

  def test_should_destroy_trip
    assert_difference('Trip.count', -1) do
      delete :destroy, :id => trips(:one).id
    end

    assert_redirected_to trips_path
  end
end
