require 'test_helper'

class NetbuilderNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @netbuilder = Netbuilder::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @netbuilder.complete?
    assert_equal "", @netbuilder.status
    assert_equal "", @netbuilder.transaction_id
    assert_equal "", @netbuilder.item_id
    assert_equal "", @netbuilder.gross
    assert_equal "", @netbuilder.currency
    assert_equal "", @netbuilder.received_at
    assert @netbuilder.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @netbuilder.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @netbuilder.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end
end
