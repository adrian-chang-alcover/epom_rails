require 'epom'

module EpomRails
	def abc
		return 'abc'
	end
end

class ActiveRecord::Base  
  def self.acts_as(klass, options = {})
    include EpomRails

  	before_save do 
  		self.name='saved in Epom' 
  	end
  end
end