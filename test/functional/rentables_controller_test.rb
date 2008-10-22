require 'test_helper'

class RentablesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:rentables)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_rentable
    assert_difference('Rentable.count') do
      post :create, :rentable => { }
    end

    assert_redirected_to rentable_path(assigns(:rentable))
  end

  def test_should_show_rentable
    get :show, :id => rentables(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => rentables(:one).id
    assert_response :success
  end

  def test_should_update_rentable
    put :update, :id => rentables(:one).id, :rentable => { }
    assert_redirected_to rentable_path(assigns(:rentable))
  end

  def test_should_destroy_rentable
    assert_difference('Rentable.count', -1) do
      delete :destroy, :id => rentables(:one).id
    end

    assert_redirected_to rentables_path
  end
end
