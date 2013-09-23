module Catalog
  module Entities
    class Money < Grape::Entity
      expose :cents, :documentation => {:type => "Integer"}
      expose :currency_as_string,
             :as => :currency,
             :documentation => {:type => "String", :desc => "ISO currency code"}
    end
  end
end
