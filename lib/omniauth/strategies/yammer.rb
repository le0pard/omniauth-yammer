require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Yammer < OmniAuth::Strategies::OAuth2

      option :name, 'yammer'
      option :provider_ignores_state, true

      option :client_options, {
        :site => (ENV['YAMMER_DOMAIN'] || 'https://www.yammer.com'),
        :authorize_url => '/oauth2/authorize',
        :token_url => '/oauth2/access_token'
      }

      uid { raw_info['id'] }

      info do
        prune!({
          :nickname => raw_info['name'],
          :name => raw_info['full_name'],
          :location => raw_info['location'],
          :image => raw_info['mugshot_url'],
          :description => raw_info['job_title'],
          :email => primary_email,
          :urls => {
            :yammer => raw_info['web_url']
          }
        })
      end

      extra do
        prune!({:raw_info => raw_info})
      end

      def request_phase
        options[:response_type] ||= 'code'
        super
      end

      def callback_phase
        request.params['state'] = session['omniauth.state']
        super
      end

      def build_access_token
        access_token = request.params[:access_token] || super
        token = eval(access_token.token)['token']
        @access_token = ::OAuth2::AccessToken.new(client, token, access_token.params)
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/current.json').parsed
      end

      def primary_email
        raw_info['contact']['email_addresses'].detect{|address| address['type'] == 'primary'}['address'] rescue nil
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end

    end
  end
end

OmniAuth.config.add_camelization 'yammer', 'Yammer'
