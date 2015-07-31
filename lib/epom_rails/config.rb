require 'active_support/configurable'

module EpomRails
  # Configures global settings for EpomRails
  #   EpomRails.configure do |config|
  #     config.offline = false
  #   end
  def self.configure(&block)
    yield @config ||= EpomRails::Configuration.new
  end

  # Global settings for EpomRails
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :offline, :advertiser, :campaign, :banner, :site, :zone, :placement

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  # this is ugly. why can't we pass the default value to config_accessor...?
  EpomRails.configure do |config|
    config.offline = false

    config.advertiser = {}
    config.advertiser[:fields] = {epom_id: 'id', name: 'name', contact_name: 'contactName', contact_email: 'contactEmail', description: 'description'}
    config.advertiser[:has_many] = [{:name => 'campaigns', :epom_element => 'Campaign', :model => 'Campaign'}]

    config.campaign = {}
    config.campaign[:fields] = {epom_id: 'id', name: 'name', description: 'description', advertiser_id: 'advertiserId', weight: 'weight'}
    config.campaign[:has_many] = [{:name => 'banners', :epom_element => 'Banner', :model => 'Banner'}]

    config.banner = {}
    config.banner[:fields] = {epom_id: 'id', placement_type: 'placementType', campaign_id: 'campaignId', weight: 'weight', image_banner_link: 'imageBannerLink', url: 'url', name: 'name', banner_type: 'bannerType', ad_unit_id: 'adUnitId', ad_unit_width: 'adUnitWidth', ad_unit_height: 'adUnitHeight'}

    config.site = {}
    config.site[:fields] = {epom_id: 'id', name: 'name', url: 'url', description: 'description', email: 'email', category_id: 'categoryId'}
    config.site[:has_many] = [{:name => 'zones', :epom_element => 'Zone', :model => 'Zone'}]

    config.zone = {}
    config.zone[:fields] = {epom_id: 'id', name: 'name', description: 'description', site_id: 'siteId'}
    config.zone[:has_many] = [{:name => 'placements', :epom_element => 'Placement', :model => 'Placement'}]

    config.placement = {}
    config.placement[:fields] = {epom_id: 'id', zone_id: 'zoneId', placement_type: 'type', name: 'name', ad_unit_id: 'adUnitId', size_height: 'size.height', size_width: 'size.width'}
  end
end
