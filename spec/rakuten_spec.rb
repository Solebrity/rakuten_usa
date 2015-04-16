require 'rakuten_usa'

RSpec.describe Rakuten do
  it 'should allow configuration by providing a block to the config method' do
    Rakuten.config do |cfg|
      cfg.token_request_auth = '123456'
      cfg.username = 'user'
      cfg.password = 'password'
      cfg.id = '9876'
    end

    expect(Rakuten.config.token_request_auth).to eq '123456'
    expect(Rakuten.config.username).to eq 'user'
    expect(Rakuten.config.password).to eq 'password'
    expect(Rakuten.config.id).to eq '9876'
  end
end
