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
        analytics = JSON.parse(Epom::Analytic.analytics(default.merge(params)))
        fields = get_config[:fields]
        analytics.map do |analytic|
          data = {}
          fields.map {|key, value| data[key] = analytic[value]}
          data[:date] = Date.parse(data[:date]) if data[:date].is_a?(String)
          self.new(data)
        end
      end
    end
	end
end