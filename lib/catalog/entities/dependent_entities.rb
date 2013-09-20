module Catalog
  module Entities
    module DependentEntities
      module ClassMethods
        def dependent_entities
          exposures.values.map {|h| h[:using]}.compact
        end
      end

      def self.included(receiver)
        receiver.extend(ClassMethods)
      end
    end
  end
end
