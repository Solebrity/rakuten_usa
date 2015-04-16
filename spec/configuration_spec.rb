require 'rakuten_usa'

RSpec.describe Rakuten::Configuration do
  it 'should allow setting the token request authorization code' do
    config = Rakuten::Configuration.new()
    config.token_request_auth = "12345"
    expect(config.token_request_auth).to eq '12345'
  end
  it 'should allow setting the username' do
    config = Rakuten::Configuration.new()
    config.username = "user"
    expect(config.username).to eq 'user'
  end
  it 'should allow setting the password' do
    config = Rakuten::Configuration.new()
    config.password = "pass"
    expect(config.password).to eq 'pass'
  end
  it 'should allow setting the SID/MID' do
    config = Rakuten::Configuration.new()
    config.id = "5678"
    expect(config.id).to eq '5678'
  end
end
