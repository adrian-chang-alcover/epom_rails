class ActiveRecord::Base 

  def self.acts_as(klass, fields = {})
    include EpomRails

    define_before_save(klass, fields)
  end

  private
  def self.define_before_save(klass, fields)
  	before_save do 
  		self.name='saved in Epom' 
  	end
  end

end