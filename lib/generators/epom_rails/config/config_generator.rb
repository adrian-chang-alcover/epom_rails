module EpomRails
	class ConfigGenerator < Rails::Generators::Base
	  source_root File.expand_path('../templates', __FILE__)

	  	def copy_epom_rails_file
	        template 'epom_rails.rb', 'config/initializers/epom_rails.rb'
	        if File.exist?('.gitignore')
	        	inject_into_file '.gitignore', after: "/.bundle" do "\nconfig/initializers/epom_rails.rb" end
	        end
	   	end
	end
end
