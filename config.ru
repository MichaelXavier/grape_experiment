require File.expand_path('lib/catalog', File.dirname(__FILE__))

use Rack::Static, :urls => %w[/docs], :root => "public"
run Catalog::API
