class ActiveRecord::Base 

  def self.acts_as_zone(fields = {})
  	EpomRails.config.zone[:model] = self
    acts_as(Epom::Zone, fields)
  end

end