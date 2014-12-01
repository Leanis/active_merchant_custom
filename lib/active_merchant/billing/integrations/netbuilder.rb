module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Netbuilder
        autoload :Return,       "active_merchant/billing/integrations/netbuilder/return.rb"
        autoload :Helper,       "active_merchant/billing/integrations/netbuilder/helper.rb"

        mattr_accessor :service_url
        mattr_accessor :merchant_code
        mattr_accessor :merchant_key

        def self.service_url
          "https://www.onlinepayment.com.my/MOLPay/pay/#{merchant_code}/"
        end

        def self.return(post, options = {})
          Return.new(post, options)
        end

      end
    end
  end
end
