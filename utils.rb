module PricingRules
  DELIVERY_RULE = ->(subtotal) do
    if subtotal < 50
      4.95
    elsif subtotal < 90
      2.95
    else
      0.0
    end
  end
end
  
module ProductCodes
  RED   = 'R01'
  GREEN = 'G01'
  BLUE  = 'B01'

  ALL = {
    red: RED,
    green: GREEN,
    blue: BLUE
  }
end