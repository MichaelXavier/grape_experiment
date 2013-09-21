require 'bundler'
Bundler.setup(:default)
require 'grape'
require 'grape-entity'
require 'grape-swagger'
require 'virtus'
require 'money'
require 'concord'
require 'pry'
require 'pry-nav'

require_relative 'catalog/models/product'

require_relative 'catalog/database'

require_relative 'catalog/entities'
require_relative 'catalog/entities/money'
require_relative 'catalog/entities/product'

require_relative 'catalog/routes/products'
require_relative 'catalog/market_price_client'
require_relative 'catalog/api'
