module Catalog
  class API < Grape::API
    prefix 'api'
    version 'v1', :using => :path
    format :json
    default_format :json

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    namespace(:products) { mount Catalog::Routes::Products }

    add_swagger_documentation :api_version => "v1",
                              :models => [
      Catalog::Entities::Product,
      Catalog::Entities::Money
    ]
  end
end
