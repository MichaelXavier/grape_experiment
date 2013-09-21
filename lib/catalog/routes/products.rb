module Catalog
  module Routes
    class Products < Grape::API
      desc "Get Products", {
        :entity => Entities::Product,
        :models => Catalog::Entities.dependency_list(Catalog::Entities::Product)
      }
      params do
        optional :prices, :type => Boolean, :default => false
        group :prices_options do
          optional :reverse, :type => Boolean, :default => false
        end
      end
      get do
        present Database.all, :with => Entities::Product, :prices => params[:prices]
      end

      desc "Show Product", {
        :entity => Entities::Product,
        :models => Catalog::Entities.dependency_list(Catalog::Entities::Product)
      }
      params do
        requires :id, :type => Integer, :desc => "Product ID"
        optional :prices, :type => Boolean, :default => false
        group :prices_options do
          optional :reverse, :type => Boolean, :default => false
        end
      end
      get ":id" do
        present Database.find(params[:id]),
          :with => Entities::Product,
          :prices => params[:prices],
          :prices_options => params[:prices_options]
      end
    end
  end
end
