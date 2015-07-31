class ActiveRecord::Base 

  def self.acts_as_campaign(fields = {})
  	EpomRails.config.campaign[:model] = self
    acts_as(Epom::Campaign, fields)
  end

end