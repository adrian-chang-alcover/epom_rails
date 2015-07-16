class ActiveRecord::Base 

  def self.acts_as_placement(fields = {})
    acts_as(Epom::Placement, fields)
  end

end