class ActiveRecord::Base 

  def self.acts_as_zone(fields = {})
    acts_as(Epom::Zone, fields)
  end

end