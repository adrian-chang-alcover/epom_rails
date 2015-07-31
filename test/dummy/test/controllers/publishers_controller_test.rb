require 'test_helper'

class PublishersControllerTest < ActionController::TestCase
  setup do
    @publisher = publishers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publishers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publisher" do
    assert_difference('Publisher.count') do
      post :create, publisher: { category_id: @publisher.category_id, description: @publisher.description, email: @publisher.email, epom_id: @publisher.epom_id, name: @publisher.name, url: @publisher.url }
    end

    assert_redirected_to publisher_path(assigns(:publisher))
  end

  test "should show publisher" do
    get :show, id: @publisher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publisher
    assert_response :success
  end

  test "should update publisher" do
    patch :update, id: @publisher, publisher: { category_id: @publisher.category_id, description: @publisher.description, email: @publisher.email, epom_id: @publisher.epom_id, name: @publisher.name, url: @publisher.url }
    assert_redirected_to publisher_path(assigns(:publisher))
  end

  test "should destroy publisher" do
    assert_difference('Publisher.count', -1) do
      delete :destroy, id: @publisher
    end

    assert_redirected_to publishers_path
  end
end
