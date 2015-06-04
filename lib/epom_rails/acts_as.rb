class ActiveRecord::Base 

  def self.acts_as(klass, fields = {})
    include EpomRails

  	before_save do 
  		self.name='saved in Epom' 
  	end
  end

end