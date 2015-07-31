class ActiveRecord::Base 

  def self.acts_as_banner(params = {})
  	EpomRails.config.banner[:model] = self
    acts_as(Epom::Banner, params)
  end

end