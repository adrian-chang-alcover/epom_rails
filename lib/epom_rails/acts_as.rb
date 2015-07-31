class ActiveRecord::Base 

  private

  def self.acts_as(klass, params)
    extend EpomRails
    
    override_fields(klass, params[:fields])
    define_before_save(klass)
    define_before_destroy(klass)
  end

  def self.get_klass_name(klass)
    klass.name.include?('::') ? klass.name.split('::').last : klass.name
  end

  def self.get_config(klass)
    klass_name = get_klass_name(klass)
    EpomRails.config.send(klass_name.downcase)
  end

  def self.override_fields(klass, fields)
    fields ||= {}
    klass_name = get_klass_name(klass)
    config = get_config(klass)
    config[:fields].merge!(fields)    
  end

  def self.define_before_save(klass)
    unless EpomRails.config.offline
    	klass_name = get_klass_name(klass)
    	fields = get_config(klass)[:fields]

    	before_save do 
        method = if self.send fields.key('id') then "update_#{klass_name.downcase}" else "create_#{klass_name.downcase}" end
        
        url_params = {}
        url_parameters = klass.extended_methods[method.to_sym][:url_parameters]
        if url_parameters
          url_parameters.each do |parameter|
            url_params[parameter] = self.send(fields.key(parameter.to_s)) if fields.key(parameter.to_s)
          end
        end
        # if campaignId, bannerId, etc, as url parameters in update action
        if url_parameters and url_parameters.include? "#{klass_name.downcase}Id".to_sym
          url_params["#{klass_name.downcase}Id".to_sym] = self.send "#{fields.key('id')}"
        end

        body_params = {}
        body_parameters = klass.extended_methods[method.to_sym][:body_parameters]
        if body_parameters
          body_parameters.each do |parameter|
            body_params[parameter] = self.send(fields.key(parameter.to_s)) if fields.key(parameter.to_s)
          end
        end
        
        epom_response = klass.send method, url_params, body_params
    		
        unless self.send fields.key('id')
    			# save id value returned from Epom
    			self.send "#{fields.key('id')}=", epom_response['id']
    		end
    		epom_response['success']
    	end
    end  
  end

  def self.define_before_destroy(klass)
    unless EpomRails.config.offline
      klass_name = get_klass_name(klass)
      fields = get_config(klass)[:fields]
      before_destroy do
        if self.send fields.key('id')          
          epom_response = klass.send "delete_#{klass_name.downcase}", {"#{klass_name.downcase}Id" => self.send(fields.key('id'))}, {}
          epom_response['success'] if epom_response
        end
      end
    end
  end

end