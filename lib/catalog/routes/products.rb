module Catalog
  module Routes
    class Products < Grape::API
      desc "Get Products", {
        :entity => Entities::Product,
        :models => [
          Catalog::Entities::Product,
          #TODO: do this implicitly
          *Catalog::Entities::Product.dependent_entities,
        ]
      }
      get do
        present Database.all, :with => Entities::Product
      end

      desc "Show Product", {
        :entity => Entities::Product
      }
      params do
        requires :id, :type => Integer, :desc => "Product ID"
      end
      route_param :id do
        get do
          puts Database.find(params[:id]).inspect
          present Database.find(params[:id]), :with => Entities::Product
        end
      end
    end
  end
end
