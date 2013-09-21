module Catalog
  module Entities
    class Product < Grape::Entity
      include DependentEntities

      expose :id, :documentation => {:type => "Integer"}
      expose :name, :documentation => {:type => "String"}
      expose :msrp, :using => ::Catalog::Entities::Money,
                    :documentation => {:type => "Money"}

      # TODO: clean up if this works out
      # takes a block but no way to have it call a method on the entity :(
      expose :prices, :using => ::Catalog::Entities::Money,
                      :if => { :prices => true } do |product, options|
        # you can use the options hash here if they specify additional options like best price, etc
        Catalog::MarketPriceClient.new(product).get_prices(options[:prices_options])
      end
    end
  end
end
