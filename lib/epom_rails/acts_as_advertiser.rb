class ActiveRecord::Base 

  def self.acts_as_advertiser(params = {})
    EpomRails.config.advertiser[:model] = self
    acts_as(Epom::Advertiser, params)

    override_has_many_campaigns
  end

  def self.override_has_many_campaigns
  	campaigns_association = EpomRails.config.advertiser[:has_many].find{|a| a[:epom_element]=="Campaign"}
  	
    if campaigns_association      
			before_add_for_campaigns << proc do |callback, advertiser, campaign| 
				puts [callback, advertiser, campaign]
			end
    end  
  end

end