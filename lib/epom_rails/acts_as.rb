class ActiveRecord::Base 

  def self.acts_as(klass, fields = {})
    extend EpomRails

    define_before_save(klass, fields)
  end

  private

  def self.define_before_save(klass, fields)
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
  			self.send "#{fields.key('id')}=", epom_response['id']
  		end
  		epom_response['success']
  	end
  end

end