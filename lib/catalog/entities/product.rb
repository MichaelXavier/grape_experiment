module Catalog
  module Entities
    class Product < Grape::Entity
      include DependentEntities

      expose :id, :documentation => {:type => "Integer"}
      expose :name, :documentation => {:type => "String"}
      expose :msrp, :using => ::Catalog::Entities::Money,
                    :documentation => {:type => "Money"}
    end
  end
end
