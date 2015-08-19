class Banner < ActiveRecord::Base
	belongs_to :campaign
	acts_as_banner
end
