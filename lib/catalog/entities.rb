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

    def self.dependency_list(*entities)
      entities.flat_map {|entity|
        [entity, *entity.dependent_entities]
      }.uniq
    end
  end
end
