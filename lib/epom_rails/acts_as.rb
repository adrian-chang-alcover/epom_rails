class ActiveRecord::Base  
  def self.acts_as(klass, options = {})
    include EpomRails

  	before_save do 
  		self.name='saved in Epom' 
  	end
  end
end