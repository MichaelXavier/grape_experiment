module Catalog
  class MarketPriceClient
    include Concord.new(:product)

    def get_prices(options = {})
      prices = (1..3).map do |n|
        Money.new(rand(1000), 'USD')
      end
      # why does this not sort properly
      prices.sort_by(&:cents)
      prices.reverse! if options[:reverse]
      prices
    end
  end
end
