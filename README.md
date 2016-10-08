# AdvanceRemoteCache

An deploy strategy for Capistrano 2.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-advance-remote-cache'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-advance-remote-cache

## Usage

In your `config/deploy.rb` of Rails app

```ruby
set :deploy_via, :advance_remote_cache
```

## TODO

- write the test cases

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capistrano-advance-remote-cache. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

