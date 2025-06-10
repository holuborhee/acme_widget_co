require_relative './product'
require_relative './special_offers'
require_relative './utils'

class Basket
  def initialize(products, delivery_rule, offers)
    # products: array of Product
    # offers: array of SpecialOffer
    @products = {}
    products.each { |p| @products[p.code] = p }

    @delivery_rule = delivery_rule

    # group offers by product code
    @offers = Hash.new { |h, k| h[k] = [] }
    offers.each do |offer|
      @offers[offer.product.code] << offer
    end

    @items = Hash.new(0)
  end

  def add(product_code)
    raise "Invalid product code: #{product_code}" unless @products.key?(product_code)

    @items[product_code] += 1
  end

  def total
    total = 0.0

    @items.each do |code, quantity|
      product = @products[code]
      if @offers.key?(code)
        total += @offers[code].reduce(0) { |sum, offer| sum + offer.apply(quantity) }
      else
        total += product.price * quantity
      end
    end

    total += @delivery_rule.call(total)
    total.round(2)
  end
end