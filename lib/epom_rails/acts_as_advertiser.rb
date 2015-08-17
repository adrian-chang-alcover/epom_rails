class ActiveRecord::Base 

  def self.acts_as_advertiser(params = {})
    EpomRails.config.advertiser[:model] = self
    acts_as(Epom::Advertiser, params)

    define_before_add_and_before_remove_for_campaigns
  end

  def self.define_before_add_and_before_remove_for_campaigns
  	campaigns_association = EpomRails.config.advertiser[:has_many].find{|a| a[:epom_element]=="Campaign"}
  	
    if campaigns_association      
			before_add_for_campaigns << proc do |callback, advertiser, campaign| 
				puts callback
			end
      before_remove_for_campaigns << proc do |callback, advertiser, campaign| 
        puts callback
        campaign.update({advertiser_id: nil})
      end
    end  
  end

end