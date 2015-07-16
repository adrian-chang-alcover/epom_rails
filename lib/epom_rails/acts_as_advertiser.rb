class ActiveRecord::Base 

  def self.acts_as_advertiser(fields = {})
    acts_as(Epom::Advertiser, fields)
  end

  def campaignss
  	byebug
  end

end