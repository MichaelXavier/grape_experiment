module Catalog
  module Models
    class Product
      include Virtus

      attribute :id, Integer
      attribute :name, String
      attribute :msrp, Money
    end
  end
end
