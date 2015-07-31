class ActiveRecord::Base 

  def self.acts_as_site(params = {})
  	EpomRails.config.site[:model] = self
    acts_as(Epom::Site, params)
  end

end