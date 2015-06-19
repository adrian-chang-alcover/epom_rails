class Site < ActiveRecord::Base
	acts_as_site epom_id: 'id', name: 'name', url: 'url', description: 'description', email: 'email', category_id: 'categoryId'
end
