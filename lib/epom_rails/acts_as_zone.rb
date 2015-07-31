class ActiveRecord::Base 

  def self.acts_as_zone(params = {})
  	EpomRails.config.zone[:model] = self
    acts_as(Epom::Zone, params)
  end

end