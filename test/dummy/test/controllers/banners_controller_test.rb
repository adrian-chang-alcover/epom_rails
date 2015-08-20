require 'test_helper'

class BannersControllerTest < ActionController::TestCase
  setup do
    @banner = banners(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banner" do
    assert_difference('Banner.count') do
      post :create, banner: { ad_unit_height: @banner.ad_unit_height, ad_unit_id: @banner.ad_unit_id, ad_unit_width: @banner.ad_unit_width, banner_type: @banner.banner_type, campaign_id: @banner.campaign_id, epom_id: @banner.epom_id, image_banner_link: @banner.image_banner_link, name: @banner.name, placement_type: @banner.placement_type, url: @banner.url, weight: @banner.weight }
    end

    assert_redirected_to banner_path(assigns(:banner))
  end

  test "should show banner" do
    get :show, id: @banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banner
    assert_response :success
  end

  test "should update banner" do
    patch :update, id: @banner, banner: { ad_unit_height: @banner.ad_unit_height, ad_unit_id: @banner.ad_unit_id, ad_unit_width: @banner.ad_unit_width, banner_type: @banner.banner_type, campaign_id: @banner.campaign_id, epom_id: @banner.epom_id, image_banner_link: @banner.image_banner_link, name: @banner.name, placement_type: @banner.placement_type, url: @banner.url, weight: @banner.weight }
    assert_redirected_to banner_path(assigns(:banner))
  end

  test "should destroy banner" do
    @banner.epom_id = nil
    @banner.save
    assert_difference('Banner.count', -1) do
      delete :destroy, id: @banner
    end

    assert_redirected_to banners_path
  end
end
