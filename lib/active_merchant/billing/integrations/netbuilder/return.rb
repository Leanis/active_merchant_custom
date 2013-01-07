require 'net/http'
require "digest/sha1"

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Netbuilder
        class Return < ActiveMerchant::Billing::Integrations::Return
          attr_accessor :merchant_code, :merchant_key

          def order
            params['orderid'].to_s
          end

          def amount
            params['amount'].to_s
          end

          def appcode
            params['appcode'].to_s
          end

          def tranID
            params['tranID'].to_s
          end

          def status
            params['status'].to_s
          end

          def cur
            params['currency'].to_s
          end

          def paydate
            params['paydate'].to_s
          end

          def channel
            params['channel'].to_s
          end

          def skey
            params['skey'].to_s
          end

          def domain
            params['domain'].to_s
          end

          def secure?
            self.skey.to_s == self.generated_signature.to_s
          end

          def success?
           secure? && self.status == '00'
          end

          def generated_signature
            key0 = Digest::MD5.hexdigest("#{self.tranID}#{self.orderid}#{self.status}#{self.merchant_code}#{self.amount}#{self.cur}")
            str = "#{self.paydate}#{self.merchant_code}#{key0}#{self.appcode}#{self.merchant_key}"
            Digest::MD5.hexdigest(str)
          end

        end
      end
    end
  end
end