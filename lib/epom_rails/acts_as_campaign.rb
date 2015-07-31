class ActiveRecord::Base 

  def self.acts_as_campaign(params = {})
  	EpomRails.config.campaign[:model] = self
    acts_as(Epom::Campaign, params)
  end

end