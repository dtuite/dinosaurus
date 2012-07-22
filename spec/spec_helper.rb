# Require application.
require "dinosaurus"

# Require testing dependencies.
require "vcr"

# An API Key must b supplied in order to regenerate VCR casettes. 
# THis is a testing account API key.
API_KEY = 'c5aedd41d31e32f3597100dd5b0d0163'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.ignore_hosts '127.0.0.1', 'localhost'

  if API_KEY 
    c.filter_sensitive_data('<API_KEY>') { API_KEY }
  end
end

Dinosaurus.configure do |c|
  c.api_key = API_KEY
end
