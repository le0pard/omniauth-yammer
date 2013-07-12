# OmniAuth Yammer [![Build Status](https://travis-ci.org/le0pard/omniauth-yammer.png)](https://travis-ci.org/le0pard/omniauth-yammer)

This gem contains the Yammer strategy for OmniAuth 1.0.

Supports the OAuth 2.0 server-side flow. Read the Yammer docs for more details: https://developer.yammer.com/authentication/#a-oauth2

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth'
gem 'omniauth-yammer'
```

or even:

```ruby
gem 'omniauth'
gem 'omniauth-yammer', :git => 'git://github.com/le0pard/omniauth-yammer.git'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Yammer` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yammer, ENV['YAMMER_KEY'], ENV['YAMMER_SECRET']
end
```

For changing default domain in gem (for dev or testing purpose) use YAMMER\_DOMAIN environment variable:

```ruby
ENV['YAMMER_DOMAIN'] = 'https://staging.yammer.com'
```

### Devise

Add this line to devise config:


```ruby
config.omniauth :yammer, "Consumer key", "Consumer secret"
```

If you have this error:

    SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed

Then you can fix this by setting valid cert:

    wget http://www.cacert.org/certs/root.crt
    cat root.crt >> lib/ca-bundle.crt

and edit devise config:

```ruby
config.omniauth :yammer, "Consumer key", "Consumer secret", {:client_options => {:ssl => {:ca_file => "#{Rails.root}/lib/ca-bundle.crt" }}}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
