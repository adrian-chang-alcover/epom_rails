EpomRails.configure do |config|
  config.offline = false

  config.advertiser = {}
  config.advertiser[:fields] = {epom_id: 'id', name: 'name', contact_name: 'contactName', contact_email: 'contactEmail', description: 'description'}
  config.advertiser[:has_many] = [{:name => 'campaigns', :epom_element => 'Campaign', :model => 'Campaign'}]

  config.campaign = {}
  config.campaign[:fields] = {epom_id: 'id', name: 'name', description: 'description', weight: 'weight', 'advertiser.epom_id' => 'advertiserId'}
  config.campaign[:has_many] = [{:name => 'banners', :epom_element => 'Banner', :model => 'Banner'}]
  config.campaign[:belongs_to] = [{:name => 'advertiser', :epom_element => 'Advertiser', :model => 'Advertiser'}]

  config.banner = {}
  config.banner[:fields] = {epom_id: 'id', placement_type: 'placementType', 'campaign.epom_id' => 'campaignId', weight: 'weight', image_banner_link: 'imageBannerLink', url: 'url', name: 'name', banner_type: 'bannerType', ad_unit_id: 'adUnitId', ad_unit_width: 'adUnitWidth', ad_unit_height: 'adUnitHeight'}
  config.banner[:has_many] = [{:name => 'placements', :epom_element => 'Placement', :model => 'Placement'}]
  config.banner[:belongs_to] = [{:name => 'campaign', :epom_element => 'Campaign', :model => 'Campaign'}]

  config.site = {}
  config.site[:fields] = {epom_id: 'id', name: 'name', url: 'url', description: 'description', email: 'email', category_id: 'categoryId'}
  config.site[:has_many] = [{:name => 'zones', :epom_element => 'Zone', :model => 'Zone'}]

  config.zone = {}
  config.zone[:fields] = {epom_id: 'id', name: 'name', description: 'description', 'site.epom_id' => 'siteId'}
  config.zone[:has_many] = [{:name => 'placements', :epom_element => 'Placement', :model => 'Placement'}]
  config.zone[:belongs_to] = [{:name => 'site', :epom_element => 'Site', :model => 'Site'}]

  config.placement = {}
  config.placement[:fields] = {epom_id: 'id', 'zone.epom_id' => 'zoneId', placement_type: 'type', name: 'name', ad_unit_id: 'adUnitId', size_height: 'size.height', size_width: 'size.width'}
  config.placement[:has_many] = [{:name => 'banners', :epom_element => 'Banner', :model => 'Banner'}]
  config.placement[:belongs_to] = [{:name => 'zone', :epom_element => 'Zone', :model => 'Zone'}]

  config.analytic = {}
  config.analytic[:fields] = {date: "Date", hour: "Hour", advertiser: "Advertiser", advertiser_id: "Advertiser ID", campaign: "Campaign", campaign_id: "Campaign ID", banner: "Banner", banner_id: "Banner ID", site: "Site", site_id: "Site ID", zone: "Zone", zone_id: "Zone ID", placement: "Placement", placement_id: "Placement ID", channel: "Channel", country: "Country", impressions: "Impressions", clicks: "Clicks", ctr: "CTR", conversions: "Conversions", i2c: "I2C", ccr: "CCR", net: "Net", gross: "Gross", profit: "Profit", ecpm_net: "eCPM Net", ecpm_gross: "eCPM Gross", ecpm_profit: "eCPM Profit", status: "Status"}
end