class ActiveRecord::Base 

  def self.acts_as_advertiser(fields = {})
    acts_as(Epom::Advertiser, fields)
  end

  def self.acts_as_campaign(fields = {})
    acts_as(Epom::Campaign, fields)
  end

  def self.acts_as_banner(fields = {})
    acts_as(Epom::Banner, fields)
  end

  def self.acts_as_site(fields = {})
    acts_as(Epom::Site, fields)
  end

  def self.acts_as_zone(fields = {})
    acts_as(Epom::Zone, fields)
  end

  def self.acts_as_placement(fields = {})
    acts_as(Epom::Placement, fields)
  end

  private

  def self.acts_as(klass, fields = {})
    extend EpomRails

    self.epom_klass = klass
    self.epom_fields = fields
    
    define_before_save
    define_before_destroy
  end

  def self.define_before_save
    unless EpomRails.config.offline
    	klass = self.epom_klass
    	fields = self.epom_fields
    	before_save do 
    		klass_name = klass.name.include?('::') ? klass.name.split('::').last : klass.name

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
    			# save id value returned from Epom in an Advertiser column
    			self.send "#{fields.key('id')}=", epom_response['id']
    		end
    		epom_response['success']
    	end
    end  
  end

  def self.define_before_destroy
    unless EpomRails.config.offline
      klass = self.epom_klass
      fields = self.epom_fields
      before_destroy do
        if self.send fields.key('id')
          klass_name = klass.name.include?('::') ? klass.name.split('::').last : klass.name
          epom_response = klass.send "delete_#{klass_name.downcase}", {"#{klass_name.downcase}Id" => self.send(fields.key('id'))}, {}
          epom_response['success'] if epom_response
        end
      end
    end
  end

end