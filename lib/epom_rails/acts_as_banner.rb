class ActiveRecord::Base 

  def self.acts_as_banner(fields = {})
  	EpomRails.banner_class = self
    acts_as(Epom::Banner, fields)
  end

end