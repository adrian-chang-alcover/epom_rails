class ActiveRecord::Base 

  def self.acts_as_site(fields = {})
  	EpomRails.config.site[:model] = self
    acts_as(Epom::Site, fields)
  end

end