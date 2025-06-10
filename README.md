# Acme Widget Co – Basket Implementation

This is a simple basket pricing engine for Acme Widget Co.

## Features

- Product catalog with unique codes and prices
- Delivery pricing rules based on subtotal thresholds
- "Buy one get second half price" offer, currently applied on Red Widgets but can be applied on other Widgets

## Assumptions made

- There should be room for other offers. "Buy one get second half price" offer is implemented here, but other kinds of offers can still extend the "SpecialOffers" class.
- Offers are always applied based on the Quantity bought
- Multiple Offers can be applied to a Widget `[BuyOneGetOneHalfPriceOffer.new(Product.new(ProductCodes::BLUE, 'Blue Widget', 7.95)), BuyFiveGetOneFreeOffer.new(Product.new(ProductCodes::BLUE, 'Blue Widget', 7.95))]`
- An offer can be applied to many Widget i.e. we can have `[BuyOneGetOneHalfPriceOffer.new(Product.new(ProductCodes::BLUE, 'Blue Widget', 7.95)), BuyOneGetOneHalfPriceOffer.new(Product.new(ProductCodes::RED, 'Red Widget', 32.95))]`

## How to Use

Run with:

```bash
ruby main.rb
```

Run automated test:

```bash
ruby test/utils_test.rb
```

```bash
ruby test/basket_test.rb
```

```bash
ruby test/special_offers_test.rb
```
