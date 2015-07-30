class ActiveRecord::Base 

  def self.acts_as_campaign(fields = {})
  	EpomRails.campaign_class = self
    acts_as(Epom::Campaign, fields)
  end

end