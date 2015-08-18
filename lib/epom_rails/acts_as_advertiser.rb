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
        if campaign.advertiser_id and advertiser.id != campaign.advertiser_id
          # remove in Epom this campaign from his older advertiser
          Advertiser.find(campaign.advertiser_id).campaigns.delete(campaign)
        end
			end
      before_remove_for_campaigns << proc do |callback, advertiser, campaign| 
        puts callback
        fields = EpomRails.config.campaign[:fields]
        # delete this campaign in Epom
        Campaign.delete_campaign({campaignId: campaign.send(fields.key('id'))})
        # set nil epom_id field for this campaign
        campaign.send "#{fields.key('id')}=", nil
      end
    end  
  end

end