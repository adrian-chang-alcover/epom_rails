class ActiveRecord::Base 

  def self.acts_as_zone(params = {})
  	EpomRails.config.zone[:model] = self
    acts_as(Epom::Zone, params)

    override_belongs_to_zone
  end

  def self.override_belongs_to_zone
  	site_association = EpomRails.config.zone[:belongs_to].find{|a| a[:epom_element]=="Site"}
  	
    # overriding belongs_to: site
  	define_method site_association[:name] do
  		fields = EpomRails.config.zone[:fields]
  		object = super()

  		if object.respond_to?(fields.key('id')) and object.send(fields.key('id'))
        # here, retrieve this site from Epom
      end
  	end
  end

end