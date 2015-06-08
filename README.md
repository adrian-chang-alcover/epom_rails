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

## Usage

The following example shows how to use the acts_as_advertiser method specifing your local attributes with the equivalent attributes in Epom. For example, your epom_id attribute is equivalent with id attribute in Epom.
 ```
class Advertiser < ActiveRecord::Base
	acts_as_advertiser epom_id: 'id', name: 'name', contact_name: 'contactName', contact_email: 'contactEmail', description: 'description'
end
```

Now, every time you save, update or delete an advertiser it is synchronized in Epom. The first time you save an advertiser the epom_id attribute (according to as specified above) is setted with the advertiser id in Epom.

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
