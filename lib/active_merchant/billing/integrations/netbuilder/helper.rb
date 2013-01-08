module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Netbuilder
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          # Replace with the real mapping
          mapping :amount, 'amount'
          mapping :order, 'orderid'
          mapping :customer, :name  => 'bill_name',
                             :email => 'bill_email',
                             :phone => 'bill_mobile'
          mapping :description, 'bill_desc'
          mapping :currency, 'cur'
          mapping :return_url, 'returnurl'

          def initialize(order, account, options = {})
            super
            add_field('vcode', Digest::MD5.hexdigest(vcode_components))
          end

          protected

          def vcode_components
            components  = []
            components << fields[mappings[:amount]]
            components << Netbuilder.merchant_code
            components << fields[mappings[:order]]
            components << Netbuilder.merchant_key
            components.join
          end

        end
      end
    end
  end
end
