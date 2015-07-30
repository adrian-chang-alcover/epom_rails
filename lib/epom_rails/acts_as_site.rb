class ActiveRecord::Base 

  def self.acts_as_site(fields = {})
  	EpomRails.site_class = self
    acts_as(Epom::Site, fields)
  end

end