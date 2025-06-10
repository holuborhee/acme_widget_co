class SpecialOffer
    attr_reader :product
  
    def initialize(product)
      if self.class == SpecialOffer
        raise NotImplementedError, "#{self.class} is an abstract class and cannot be instantiated directly."
      end
      @product = product
    end
  
    def apply(quantity)
      raise NotImplementedError, "#{self.class} must implement the #apply method"
    end
end
  
class BuyOneGetOneHalfPriceOffer < SpecialOffer
    def apply(quantity)
      pairs = quantity / 2
      remaining = quantity % 2
      total = (pairs * 1.5 * product.price) + (remaining * product.price)
      (total * 100).floor / 100.0
    end
end