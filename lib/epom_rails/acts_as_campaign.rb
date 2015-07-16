class ActiveRecord::Base 

  def self.acts_as_campaign(fields = {})
    acts_as(Epom::Campaign, fields)
  end

end