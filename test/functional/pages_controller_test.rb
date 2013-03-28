# -*- encoding : utf-8 -*-
require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get apropos" do
    get :apropos
    assert_response :success
  end

  test "should get confidentialite" do
    get :confidentialite
    assert_response :success
  end

  test "should get conditions" do
    get :conditions
    assert_response :success
  end

  test "should get aide" do
    get :aide
    assert_response :success
  end

end
