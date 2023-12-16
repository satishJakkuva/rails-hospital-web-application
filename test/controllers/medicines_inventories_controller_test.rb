require "test_helper"

class MedicinesInventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medicines_inventories_index_url
    assert_response :success
  end

  test "should get create" do
    get medicines_inventories_create_url
    assert_response :success
  end

  test "should get show" do
    get medicines_inventories_show_url
    assert_response :success
  end

  test "should get update" do
    get medicines_inventories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get medicines_inventories_destroy_url
    assert_response :success
  end
end
