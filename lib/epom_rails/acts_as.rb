class ActiveRecord::Base 

  def self.acts_as(klass, fields = {}, safe_locally = true)
    include EpomRails

  	before_save do 
  		self.name='saved in Epom' 
  	end
  end

end