# EpomRails

The EpomRails gem is wrapper for Epom gem in Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'epom_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install epom_rails

There's a handy generator that generates the default configuration file into config/initializers directory.
Run the following generator command, then edit the generated file.
`$ rails g epom:config`

## Usage

The following example shows how to use the acts_as_advertiser method specifing your local attributes with the equivalent attributes in Epom. For example, your epom_id attribute is equivalent with id attribute in Epom.
 ```
class Advertiser < ActiveRecord::Base
	acts_as_advertiser epom_id: 'id', name: 'name', contact_name: 'contactName', contact_email: 'contactEmail', description: 'description'
end
```

Now, every time you save, update or delete an advertiser it is synchronized in Epom. The first time you save an advertiser the epom_id attribute (according to specified above) is setted with the advertiser id in Epom.

You have the method <code>acts_as_campaign</code>, <code>acts_as_banner</code>, <code>acts_as_site</code>, <code>acts_as_zone</code> and <code>acts_as_placement</code> too.
```
class Campaign < ActiveRecord::Base
	acts_as_campaign epom_id: 'id', name: 'name', description: 'description', advertiser_id: 'advertiserId', weight: 'weight'
end
```

```
class Banner < ActiveRecord::Base
	acts_as_banner epom_id: 'id', placement_type: 'placementType', campaign_id: 'campaignId', weight: 'weight', image_banner_link: 'imageBannerLink', url: 'url', name: 'name', banner_type: 'bannerType', ad_unit_id: 'adUnitId', ad_unit_width: 'adUnitWidth', ad_unit_height: 'adUnitHeight'
end
```

```
class Site < ActiveRecord::Base
	acts_as_site epom_id: 'id', name: 'name', url: 'url', description: 'description', email: 'email', category_id: 'categoryId'
end
```

```
class Zone < ActiveRecord::Base
	acts_as_zone epom_id: 'id', name: 'name', description: 'description', site_id: 'siteId'
end
```

```
class Placement < ActiveRecord::Base
	acts_as_placement epom_id: 'id', zone_id: 'zoneId', placement_type: 'type', name: 'name', ad_unit_id: 'adUnitId', size_height: 'size.height', size_width: 'size.width'
end
```

Also, you can call the others Epom methods.
```
url_params = {:advertiserId => 'advertiser_id'}
body_params = {}
Advertiser.get_campaigns_for_advertiser(url_params, body_params)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/epom_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
