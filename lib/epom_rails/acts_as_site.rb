class ActiveRecord::Base 

  def self.acts_as_site(fields = {})
    acts_as(Epom::Site, fields)
  end

end