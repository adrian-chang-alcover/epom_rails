class ActiveRecord::Base 

  def self.acts_as_placement(params = {})
  	EpomRails.config.placement[:model] = self
    acts_as(Epom::Placement, params)
  end

end