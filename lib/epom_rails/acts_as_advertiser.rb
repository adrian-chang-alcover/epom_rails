class ActiveRecord::Base 

  def self.acts_as_advertiser(parameters)
  	fields = parameters.select{|key, value| self.column_names.include? key}
    acts_as(Epom::Advertiser, fields)

    parameters[:has_many].each {|option| has_many_wrapper(option)} if parameters[:has_many]
  end

  private
  def self.has_many_wrapper(options)
  	association = has_many options[:name].to_sym, options.except(:name)
  	
    self.class_eval do 
  		alias_method "#{options[:name]}_original", options[:name] 

      define_method options[:name] do
        'hello'
      end 

      byebug
  	end
  end
end