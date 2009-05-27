require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, :client => { }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, :id => clients(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => clients(:one).id
    assert_response :success
  end

  test "should update client" do
    put :update, :id => clients(:one).id, :client => { }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, :id => clients(:one).id
    end

    assert_redirected_to clients_path
  end
end
