require 'minitest/autorun'
require_relative '../utils'  # Adjust the path if needed

class PricingRulesTest < Minitest::Test
  def test_delivery_fee_under_50
    assert_equal 4.95, PricingRules::DELIVERY_RULE.call(49.99)
    assert_equal 4.95, PricingRules::DELIVERY_RULE.call(0)
  end

  def test_delivery_fee_between_50_and_90
    assert_equal 2.95, PricingRules::DELIVERY_RULE.call(50.00)
    assert_equal 2.95, PricingRules::DELIVERY_RULE.call(89.99)
  end

  def test_delivery_fee_90_and_above
    assert_equal 0.0, PricingRules::DELIVERY_RULE.call(90.00)
    assert_equal 0.0, PricingRules::DELIVERY_RULE.call(150.75)
  end
end