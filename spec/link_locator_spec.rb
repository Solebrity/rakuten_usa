require 'rakuten_usa'
require 'nokogiri'

RSpec.describe Rakuten::LinkLocator do
  before :each do
    Rakuten.config do |cfg|
      cfg.token_request_auth = 'Basic aEN2WTJUUHp4VnpsNms0cVBrZDVhMWtOQWkwYTpNZnpiaVZBbVZlMUNydWdBWXBmVUZDNmplYjRh'
      cfg.username = 'Solebrity'
      cfg.password = 'Liijuvp9293'
      cfg.id = '3234525'
    end

    @link_locator = Rakuten::LinkLocator.new
  end

  it 'should return merchant info for an ID' do
    info = @link_locator.find_merchant(40072)
    expect(info).not_to be_nil
    doc = Nokogiri::XML(info)
    expect(doc.xpath('//ns1:return/ns1:name').first.content).to eq 'Ben Sherman US'
  end

  it 'should return categories for a merchant' do
    response = @link_locator.get_merchant_categories(40072)
    # p response
    expect(response).not_to be_nil
    doc = Nokogiri::XML(response)
    expect(doc.xpath('//ns1:return').count).to be 4
    expect(doc.xpath('//ns1:return[ns1:catId=200517552]/ns1:catName').first.content).to eq 'Ben Sherman US'
  end

  it 'should return all products for a specific merchant category' do
    response = @link_locator.get_products_by_category(40072, 200517552)
    # p response
    expect(response).not_to be_nil
    doc = Nokogiri::XML(response)
    expect(doc.xpath('//ns1:return').count).to be 8
  end

end
