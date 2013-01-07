require 'test_helper'

class NetbuilderModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def test_notification_method
    assert_instance_of Netbuilder::Notification, Netbuilder.notification('name=cody')
  end
end
