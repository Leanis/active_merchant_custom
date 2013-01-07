require File.dirname(__FILE__) + '/netbuilder/helper.rb'
require File.dirname(__FILE__) + '/netbuilder/return.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Netbuilder

        mattr_accessor :service_url
        mattr_accessor :merch_key

        # The merchant key provided to you by iPay88.
        def self.merchant_key
          self.merch_key
        end

        def self.merchant_key=(key)
          self.merch_key = key
        end

        def self.service_url(merchant_code,params)
          "https://www.onlinepayment.com.my/NBepay/pay/#{merchant_code}/?#{params.keys.collect { |key| "#{key}=#{CGI.escape(params[key].to_s)}" }.join("&")}"
        end

        def self.return(query_string)
          Return.new(query_string)
        end

      end
    end
  end
end
