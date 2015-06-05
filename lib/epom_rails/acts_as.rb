class ActiveRecord::Base 

  def self.acts_as_advertiser(fields = {})
    acts_as(Epom::Advertiser, fields)
  end

  private

  def self.acts_as(klass, fields = {})
    extend EpomRails

    self.epom_klass = klass
    self.epom_fields = fields
    
    define_before_save
  end

  def self.define_before_save
  	klass = self.epom_klass
  	fields = self.epom_fields
  	before_save do 
  		klass_name = klass.name.include?('::') ? klass.name.split('::').last : klass.name

  		timestamp = Time.now.to_i * 1000
  		body_params = {
	      :hash => Epom.create_hash(Epom.create_hash(ENV['password']), timestamp),
	      :timestamp => timestamp, 
	      :username => ENV['username']
	    }
		fields.each { |local_field, remote_field| body_params[remote_field] = self.send local_field }

  		if self.send fields.key('id')
  			# update in Epom
  			epom_response = klass.send "update_#{klass_name.downcase}", {}, body_params
  		else
  			# create in Epom
  			body_params.delete('id')
  			epom_response = klass.send "create_#{klass_name.downcase}", {}, body_params
  			# save id value returned from Epom in an Advertiser column
  			self.send "#{fields.key('id')}=", epom_response['id']
  		end
  		epom_response['success']
  	end
  end

end