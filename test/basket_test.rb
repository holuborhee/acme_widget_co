# test/basket_test.rb
require 'minitest/autorun'
require_relative '../basket'
require_relative '../utils'

class BasketTest < Minitest::Test
  def setup
    red_widget = Product.new(ProductCodes::RED, 'Red Widget', 32.95)
    green_widget = Product.new(ProductCodes::GREEN, 'Green Widget', 24.95)
    blue_widget = Product.new(ProductCodes::BLUE, 'Blue Widget', 7.95)
    @products = [red_widget, green_widget, blue_widget]
    @offers = [BuyOneGetOneHalfPriceOffer.new(red_widget)]
    @delivery_rule = PricingRules::DELIVERY_RULE
  end

  def build_basket(codes)
    basket = Basket.new(@products, @delivery_rule, @offers)
    codes.each { |code| basket.add(code) }
    basket
  end

  def test_total_for_b01_and_g01
    basket = build_basket(['B01', 'G01'])
    assert_equal 37.85, basket.total
  end

  def test_total_for_two_r01
    basket = build_basket(['R01', 'R01'])
    assert_equal 54.37, basket.total
  end

  def test_total_for_r01_and_g01
    basket = build_basket(['R01', 'G01'])
    assert_equal 60.85, basket.total
  end

  def test_total_for_complex_basket
    basket = build_basket(['B01', 'B01', 'R01', 'R01', 'R01'])
    assert_equal 98.27, basket.total
  end
end
