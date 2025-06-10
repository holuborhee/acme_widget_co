# === Setup ===
require_relative './basket'
require_relative './product'
require_relative './special_offers'
require_relative './utils'


red_widget = Product.new(ProductCodes::RED, 'Red Widget', 32.95)
green_widget = Product.new(ProductCodes::GREEN, 'Green Widget', 24.95)
blue_widget = Product.new(ProductCodes::BLUE, 'Blue Widget', 7.95)

products = [red_widget, green_widget, blue_widget]
offers = [BuyOneGetOneHalfPriceOffer.new(red_widget)]

# === Example Baskets ===

# Basket 1: B01, G01
basket1 = Basket.new(products, PricingRules::DELIVERY_RULE, offers)
basket1.add(ProductCodes::BLUE)
basket1.add(ProductCodes::GREEN)
puts "Basket: B01, G01 => Total: $#{basket1.total}"

# Basket 2: R01, R01
basket2 = Basket.new(products, PricingRules::DELIVERY_RULE, offers)
basket2.add(ProductCodes::RED)
basket2.add(ProductCodes::RED)
puts "Basket: R01, R01 => Total: $#{basket2.total}"

# Basket 3: R01, G01
basket3 = Basket.new(products, PricingRules::DELIVERY_RULE, offers)
basket3.add(ProductCodes::RED)
basket3.add(ProductCodes::GREEN)
puts "Basket: R01, G01 => Total: $#{basket3.total}"

# Basket 4: B01, B01, R01, R01, R01
basket4 = Basket.new(products, PricingRules::DELIVERY_RULE, offers)
basket4.add(ProductCodes::BLUE)
basket4.add(ProductCodes::BLUE)
basket4.add(ProductCodes::RED)
basket4.add(ProductCodes::RED)
basket4.add(ProductCodes::RED)
puts "Basket: B01, B01, R01, R01, R01 => Total: $#{basket4.total}"