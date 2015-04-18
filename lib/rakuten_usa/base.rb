module Rakuten
  class Base

    attr_accessor :last_query, :last_opts

    def client
      @client ||= Rakuten::Client.new
    end
  end
end
