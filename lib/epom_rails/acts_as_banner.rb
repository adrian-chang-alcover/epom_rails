class ActiveRecord::Base 

  def self.acts_as_banner(fields = {})
    acts_as(Epom::Banner, fields)
  end

end