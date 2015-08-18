class ActiveRecord::Base 

  def method_missing(method_name)
    fields = self.class.get_config[:fields]

    # shortcut for epom fields, instead of self.send(fields.key(epom_field))
    # use self.send(epom_field)
    if fields.values.include?(method_name.to_s)
      real_method = fields.key(method_name.to_s)
      return self.send(real_method)
    else
      super
    end
  end 

  private

  def self.acts_as(klass, params)
    extend EpomRails
    
    override_config(klass, params)
    define_before_save(klass)
    define_before_destroy(klass)
  end

  def self.get_epom_class_name
    # for Epom::Site returns Site
    epom_class.name.include?('::') ? epom_class.name.split('::').last : epom_class.name
  end

  def self.get_config
    klass_name = get_epom_class_name
    EpomRails.config.send(klass_name.downcase)
  end

  def self.override_config(klass, params)
    config = get_config
    config[:fields] = params[:fields] if params[:fields]
    config[:has_many] = params[:has_many] if params[:has_many]
    config[:belongs_to] = params[:belongs_to] if params[:belongs_to]
  end

  def self.define_before_save(klass)
  	klass_name = get_epom_class_name
  	fields = get_config[:fields]

  	before_save do 
      puts "before_save for #{self.inspect}"
      unless EpomRails.config.offline
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
    klass_name = get_epom_class_name
    fields = get_config[:fields]
    before_destroy do
      puts "before_destroy for #{self.inspect}"
      unless EpomRails.config.offline
        if self.send fields.key('id')          
          epom_response = klass.send "delete_#{klass_name.downcase}", {"#{klass_name.downcase}Id" => self.send(fields.key('id'))}, {}
          epom_response['success'] if epom_response
        end
      end
    end
  end

end