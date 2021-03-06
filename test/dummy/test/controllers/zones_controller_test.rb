require 'test_helper'

class ZonesControllerTest < ActionController::TestCase
  setup do
    @zone = zones(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zone" do
    assert_difference('Zone.count') do
      post :create, zone: { description: @zone.description, epom_id: @zone.epom_id, name: @zone.name, publisher_id: @zone.publisher_id }
    end

    assert_redirected_to zone_path(assigns(:zone))
  end

  test "should show zone" do
    get :show, id: @zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zone
    assert_response :success
  end

  test "should update zone" do
    patch :update, id: @zone, zone: { description: @zone.description, epom_id: @zone.epom_id, name: @zone.name, publisher_id: @zone.publisher_id }
    assert_redirected_to zone_path(assigns(:zone))
  end

  test "should destroy zone" do
    @zone.epom_id = nil
    @zone.save
    assert_difference('Zone.count', -1) do
      delete :destroy, id: @zone
    end

    assert_redirected_to zones_path
  end
end
