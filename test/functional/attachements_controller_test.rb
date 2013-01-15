require 'test_helper'

class AttachementsControllerTest < ActionController::TestCase
  setup do
    @attachement = attachements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attachements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attachement" do
    assert_difference('Attachement.count') do
      post :create, :attachement => { :label => @attachement.label, :path => @attachement.path }
    end

    assert_redirected_to attachement_path(assigns(:attachement))
  end

  test "should show attachement" do
    get :show, :id => @attachement
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @attachement
    assert_response :success
  end

  test "should update attachement" do
    put :update, :id => @attachement, :attachement => { :label => @attachement.label, :path => @attachement.path }
    assert_redirected_to attachement_path(assigns(:attachement))
  end

  test "should destroy attachement" do
    assert_difference('Attachement.count', -1) do
      delete :destroy, :id => @attachement
    end

    assert_redirected_to attachements_path
  end
end
