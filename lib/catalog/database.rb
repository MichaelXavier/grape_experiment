require 'singleton'

module Catalog
  class Database
    DATA = [
      Models::Product.new(:id   => 1,
                          :name => "Adarkar Wastes",
                          :msrp => Money.new(2000, 'USD')),
      Models::Product.new(:id   => 2,
                          :name => "Adarkar Wastes",
                          :msrp => Money.new(2000, 'USD')),
      Models::Product.new(:id   => 3,
                          :name => "Adarkar Wastes",
                          :msrp => Money.new(2000, 'USD')),
    ].each_with_object({}) {|p, acc| acc[p.id] = p}

    def self.all
      DATA.values
    end

    def self.find(*args, &block)
      DATA.fetch(*args, &block)
    end
  end
end
