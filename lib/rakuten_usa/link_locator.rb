require 'nokogiri'
module Rakuten
  class LinkLocator < Rakuten::Base
    ENDPOINT = '/linklocator/1.0'

    def find_merchant(mid)
      client.make_request("#{ENDPOINT}/getMerchByID/#{mid}")
    end

    def find_merchant_by_name(name)
      client.make_request("#{ENDPOINT}/getMerchByName/#{name}")
    end

    def find_merchants_by_category(category)
      p 'Not yet implemented'
      # Please see https://rakutenlinkshare.zendesk.com/hc/en-us/articles/201328803-LinkLocator-Direct-Advertiser-Category-Table
    end

    def find_merchants_by_status(status)
      p 'Not yet implemented'
      # Please see https://rakutenlinkshare.zendesk.com/hc/en-us/articles/201078137-LinkLocator-Direct-Application-Status-Table
    end

    def get_merchant_categories(mid)
      client.make_request("#{ENDPOINT}/getCreativeCategories/#{mid}")
    end

    def get_products_by_category(mid, cat_id, page=1)
      client.make_request("#{ENDPOINT}/getProductLinks/#{mid}/#{cat_id}/-1/#{page}")
    end

    def get_merchant_products(mid)
      categories = Nokogiri::XML(get_merchant_categories(mid)).xpath('//ns1:catId')
      result = []
      categories.each do |cat|
        page = 1
        loop do
          begin
            next_result = Nokogiri::XML(get_products_by_category(mid, cat.content, page)).xpath('//ns1:return')
            page += 1

            count = next_result.count
            if(count > 0)
              next_result.each do |node|
                result << node
              end
            else
              break
            end
          rescue
            break
          end
        end
        
      end
      p result
      result
    end

    # Text links
    # Banner links
    # DRM links
  end
end
