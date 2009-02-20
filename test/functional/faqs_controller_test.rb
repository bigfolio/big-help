require 'test_helper'

class FaqsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faq" do
    assert_difference('Faq.count') do
      post :create, :faq => { }
    end

    assert_redirected_to faq_path(assigns(:faq))
  end

  test "should show faq" do
    get :show, :id => faqs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => faqs(:one).id
    assert_response :success
  end

  test "should update faq" do
    put :update, :id => faqs(:one).id, :faq => { }
    assert_redirected_to faq_path(assigns(:faq))
  end

  test "should destroy faq" do
    assert_difference('Faq.count', -1) do
      delete :destroy, :id => faqs(:one).id
    end

    assert_redirected_to faqs_path
  end
end
