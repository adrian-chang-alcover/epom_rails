class ActiveRecord::Base 

  def self.acts_as_placement(params = {})
  	EpomRails.config.placement[:model] = self
    acts_as(Epom::Placement, params)

    define_key_method
  end

  private
	def self.define_key_method
    self.class_eval do
      def epom_key
		  	response = Epom::Placement.get_placement_summary({placementIds: self.epom_id})
    		response['key']
      end
    end
	end

end