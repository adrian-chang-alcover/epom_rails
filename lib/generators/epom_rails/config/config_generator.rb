module EpomRails
	class ConfigGenerator < Rails::Generators::Base
	  source_root File.expand_path('../templates', __FILE__)

	  	def copy_epom_rails_file
	        template 'epom_rails.rb', 'config/initializers/epom_rails.rb'
	        if File.exist?('.gitignore')
	        	File.open('.gitignore','a'){|f| f.write("\nconfig/initializers/epom_rails.rb")}
	        end
	        if File.exist?('../../.gitignore')
	        	File.open('../../.gitignore','a'){|f| f.write("\ntest/dummy/config/initializers/epom_rails.rb")}
	        end
	   	end

	   	def epom_generator
	   		generate 'epom:config'
	   	end
	end
end
