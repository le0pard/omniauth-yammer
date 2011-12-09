# OmniAuth Yammer

This gem contains the Yammer strategy for OmniAuth 1.0.

Supports the OAuth 2.0 server-side flow. Read the Yammer docs for more details: https://developer.yammer.com/api/oauth2.html

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-yammer'
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
