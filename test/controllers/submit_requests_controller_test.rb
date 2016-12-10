require 'test_helper'

class SubmitRequestsControllerTest < ActionController::TestCase
  setup do
    @submit_request = submit_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submit_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submit_request" do
    assert_difference('SubmitRequest.count') do
      post :create, submit_request: { message: @submit_request.message, request_user_id: @submit_request.request_user_id, status: @submit_request.status, task_id: @submit_request.task_id, user_id: @submit_request.user_id }
    end

    assert_redirected_to submit_request_path(assigns(:submit_request))
  end

  test "should show submit_request" do
    get :show, id: @submit_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submit_request
    assert_response :success
  end

  test "should update submit_request" do
    patch :update, id: @submit_request, submit_request: { message: @submit_request.message, request_user_id: @submit_request.request_user_id, status: @submit_request.status, task_id: @submit_request.task_id, user_id: @submit_request.user_id }
    assert_redirected_to submit_request_path(assigns(:submit_request))
  end

  test "should destroy submit_request" do
    assert_difference('SubmitRequest.count', -1) do
      delete :destroy, id: @submit_request
    end

    assert_redirected_to submit_requests_path
  end
end
