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
      def self.analytic_from_epom
    		params = {
          :format => 'JSON',
          :displayIds => true,
          :range => 'CURRENT_MONTH',
          :groupBy => 'ADVERTISER,CAMPAIGN,BANNER,SITE,ZONE,PLACEMENT,CHANNEL,COUNTRY',
          # :groupRange => 'HOUR',
          :eqLong => {'ADVERTISER' => 1252, 'SITE' => 1059}
        }
        response = self.analytics(params)
      end
    end
	end
end