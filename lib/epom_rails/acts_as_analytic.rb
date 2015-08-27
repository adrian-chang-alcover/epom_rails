class ActiveRecord::Base 
	def self.acts_as_analytic(params = {})
		EpomRails.config.analytic[:model] = self

    extend EpomRails   
    override_config(Epom::Analytic, params)

    define_analytic_from_epom
	end

  private
	def self.define_analytic_from_epom
    self.class_eval do
      def self.analytic_from_epom(params)
    		default = {
          :format => 'JSON',
          :displayIds => true,
          :groupBy => 'ADVERTISER,CAMPAIGN,BANNER,SITE,ZONE,PLACEMENT,CHANNEL,COUNTRY',
          :groupRange => 'DAY',
        }
        analytics = JSON.parse(self.analytics(default.merge(params)))
        # analytics = [{"Date"=>"01/08/2015", "Advertiser"=>"Praneet Shrivastava", "Advertiser ID"=>"911", "Campaign"=>"Camoaign by Praneet", "Campaign ID"=>"1409", "Banner"=>"Banner1", "Banner ID"=>"2364", "Site"=>"CN Beauty", "Site ID"=>"687", "Zone"=>"Zone Malaysia", "Zone ID"=>"762", "Placement"=>"CN Beauty site", "Placement ID"=>"1308", "Channel"=>"", "Country"=>"Malaysia", "Impressions"=>"642", "Clicks"=>"0", "CTR"=>"0.0000%", "Conversions"=>"0", "I2C"=>"0.0000%", "CCR"=>"0.0000%", "Net"=>"0.000", "Gross"=>"0.000", "Profit"=>"0.000", "eCPM Net"=>"0.000", "eCPM Gross"=>"0.000", "eCPM Profit"=>"0.000", "Status"=>"Preliminary confirmed"}, {"Date"=>"01/08/2015", "Advertiser"=>"Praneet Shrivastava", "Advertiser ID"=>"911", "Campaign"=>"Camoaign by Praneet", "Campaign ID"=>"1409", "Banner"=>"Banner1", "Banner ID"=>"2364", "Site"=>"CN Beauty", "Site ID"=>"687", "Zone"=>"Zone Malaysia", "Zone ID"=>"762", "Placement"=>"CN Beauty site", "Placement ID"=>"1308", "Channel"=>"", "Country"=>"Indonesia", "Impressions"=>"33", "Clicks"=>"0", "CTR"=>"0.0000%", "Conversions"=>"0", "I2C"=>"0.0000%", "CCR"=>"0.0000%", "Net"=>"0.000", "Gross"=>"0.000", "Profit"=>"0.000", "eCPM Net"=>"0.000", "eCPM Gross"=>"0.000", "eCPM Profit"=>"0.000", "Status"=>"Preliminary confirmed"}, {"Date"=>"01/08/2015", "Advertiser"=>"Praneet Shrivastava", "Advertiser ID"=>"911", "Campaign"=>"Camoaign by Praneet", "Campaign ID"=>"1409", "Banner"=>"Banner1", "Banner ID"=>"2364", "Site"=>"CN Beauty", "Site ID"=>"687", "Zone"=>"Zone Malaysia", "Zone ID"=>"762", "Placement"=>"CN Beauty site", "Placement ID"=>"1308", "Channel"=>"", "Country"=>"Brunei Darussalam", "Impressions"=>"31", "Clicks"=>"0", "CTR"=>"0.0000%", "Conversions"=>"0", "I2C"=>"0.0000%", "CCR"=>"0.0000%", "Net"=>"0.000", "Gross"=>"0.000", "Profit"=>"0.000", "eCPM Net"=>"0.000", "eCPM Gross"=>"0.000", "eCPM Profit"=>"0.000", "Status"=>"Preliminary confirmed"}, {"Date"=>"01/08/2015", "Advertiser"=>"Praneet Shrivastava", "Advertiser ID"=>"911", "Campaign"=>"Camoaign by Praneet", "Campaign ID"=>"1409", "Banner"=>"Banner1", "Banner ID"=>"2364", "Site"=>"CN Beauty", "Site ID"=>"687", "Zone"=>"Zone Malaysia", "Zone ID"=>"762", "Placement"=>"CN Beauty site", "Placement ID"=>"1308", "Channel"=>"", "Country"=>"Singapore", "Impressions"=>"31", "Clicks"=>"0", "CTR"=>"0.0000%", "Conversions"=>"0", "I2C"=>"0.0000%", "CCR"=>"0.0000%", "Net"=>"0.000", "Gross"=>"0.000", "Profit"=>"0.000", "eCPM Net"=>"0.000", "eCPM Gross"=>"0.000", "eCPM Profit"=>"0.000", "Status"=>"Preliminary confirmed"}, {"Date"=>"01/08/2015", "Advertiser"=>"NetUy", "Advertiser ID"=>"1253", "Campaign"=>"Netuy Envios de Titulares Matinales Campaña 2015", "Campaign ID"=>"1661", "Banner"=>"NetUy envíos", "Banner ID"=>"2598", "Site"=>"El Observador", "Site ID"=>"1059", "Zone"=>"Newsletters", "Zone ID"=>"1211", "Placement"=>"Titulares_Matinal_Cabezal", "Placement ID"=>"1704", "Channel"=>"", "Country"=>"Uruguay", "Impressions"=>"8", "Clicks"=>"0", "CTR"=>"0.0000%", "Conversions"=>"0", "I2C"=>"0.0000%", "CCR"=>"0.0000%", "Net"=>"0.000", "Gross"=>"0.000", "Profit"=>"0.000", "eCPM Net"=>"0.000", "eCPM Gross"=>"0.000", "eCPM Profit"=>"0.000", "Status"=>"Preliminary confirmed"}]
        fields = get_config[:fields]
        analytics.map do |analytic|
          data = {}
          fields.map {|key, value| data[key] = analytic[value]}
          data[:date] = Date.parse(data[:date]) if data[:date].is_a?(String)
          Analytic.new(data)
        end
      end
    end
	end
end