require 'minitest/autorun'
require_relative '../special_offers'
require_relative '../product'

class BuyOneGetOneHalfPriceOfferTest < Minitest::Test
  def setup
    @product = Product.new('123', 'Test Product', 32.95)
    @offer = BuyOneGetOneHalfPriceOffer.new(@product)
  end

  def test_single_item_no_discount
    assert_equal 32.95, @offer.apply(1)
  end

  def test_two_items_one_half_price
    assert_equal 49.42, @offer.apply(2)
  end

  def test_three_items_two_full_one_half
    assert_equal 82.37, @offer.apply(3)
  end

  def test_four_items_two_half_price
    assert_equal 98.85, @offer.apply(4)
  end
end
