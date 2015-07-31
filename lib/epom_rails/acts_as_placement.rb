class ActiveRecord::Base 

  def self.acts_as_placement(fields = {})
  	EpomRails.config.placement[:model] = self
    acts_as(Epom::Placement, fields)
  end

end