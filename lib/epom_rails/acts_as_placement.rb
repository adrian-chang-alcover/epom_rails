class ActiveRecord::Base 

  def self.acts_as_placement(fields = {})
  	EpomRails.placement_class = self
    acts_as(Epom::Placement, fields)
  end

end