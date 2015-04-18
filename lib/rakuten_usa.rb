require "rakuten_usa/version"
require "rakuten_usa/client"
require "rakuten_usa/base"
require "rakuten_usa/configuration"
require "rakuten_usa/link_locator"

module Rakuten
  def self.config
    @config ||= Rakuten::Configuration.new
    yield @config if block_given?
    @config
  end

  def self.search_products(keyword, params = {})
    params[:keyword] = keyword
    client.make_request('/productsearch/1.0', params)
  end

  private

  def self.client
    @client ||= Rakuten::Client.new
  end
end
