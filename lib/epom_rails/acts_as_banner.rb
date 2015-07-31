class ActiveRecord::Base 

  def self.acts_as_banner(fields = {})
  	EpomRails.config.banner[:model] = self
    acts_as(Epom::Banner, fields)
  end

end