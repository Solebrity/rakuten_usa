require 'httparty'
module Rakuten
  class Client
    include HTTParty

    base_uri 'https://api.rakutenmarketing.com'

    attr_reader :api_token

    def make_request(resource, params = {})

      regenerate_access_token if api_token().nil?

      p "GET https://api.rakutenmarketing.com#{resource}?#{params.each{|k,v| k.to_s + '=' + v.to_s}}"
      p "Headers: #{{ 'Authorization' => "Bearer #{api_token}" }.inspect}"
      response = self.class.get(
        resource,
        query: params,
        headers: { 'Authorization' => "Bearer #{api_token}" }
      )

      if response.code == 401
        regenerate_access_token
        sleep 5
        make_request(resource, params)
      end
      response.body
    end

    def regenerate_access_token
      p 'Generating access_token...'
      p 'POST https://api.rakutenmarketing.com/token'
      params = { headers: { 'Authorization' => Rakuten.config.token_request_auth },
          body: {
            grant_type: 'password',
            username: Rakuten.config.username,
            password: Rakuten.config.password,
            scope: Rakuten.config.id
          }
        }
        p params.inspect

      response = self.class.post(
        '/token',
        headers: { 'Authorization' => Rakuten.config.token_request_auth },
        body: {
          grant_type: 'password',
          username: Rakuten.config.username,
          password: Rakuten.config.password,
          scope: Rakuten.config.id
        }
      )

      if(response.code == 200)
        @api_token = JSON.parse(response.body)['access_token']
        p "Saving API Token: #{api_token}"
      else
        fail 'Error retrieving api_token'
      end
    end
  end
end
