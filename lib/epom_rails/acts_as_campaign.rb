class ActiveRecord::Base 

  def self.acts_as_campaign(params = {})
  	EpomRails.config.campaign[:model] = self
    acts_as(Epom::Campaign, params)

    override_belongs_to_advertiser
  end

  def self.override_belongs_to_advertiser
  	advertiser_association = EpomRails.config.campaign[:belongs_to].find{|a| a[:epom_element]=="Advertiser"}
  	
  	define_method advertiser_association[:name] do
  		fields = EpomRails.config.campaign[:fields]
  		object = super()

  		if object.respond_to?(fields.key('id')) and object.send(fields.key('id'))
        # here, retrieve this advertiser from Epom
      end
  	end
  end

end  