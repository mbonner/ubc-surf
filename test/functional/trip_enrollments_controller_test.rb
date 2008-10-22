require File.dirname(__FILE__) + '/../test_helper'

class TripEnrollmentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_enrollments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_trip_enrollment
    assert_difference('TripEnrollment.count') do
      post :create, :trip_enrollment => { }
    end

    assert_redirected_to trip_enrollment_path(assigns(:trip_enrollment))
  end

  def test_should_show_trip_enrollment
    get :show, :id => trip_enrollments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => trip_enrollments(:one).id
    assert_response :success
  end

  def test_should_update_trip_enrollment
    put :update, :id => trip_enrollments(:one).id, :trip_enrollment => { }
    assert_redirected_to trip_enrollment_path(assigns(:trip_enrollment))
  end

  def test_should_destroy_trip_enrollment
    assert_difference('TripEnrollment.count', -1) do
      delete :destroy, :id => trip_enrollments(:one).id
    end

    assert_redirected_to trip_enrollments_path
  end
end
