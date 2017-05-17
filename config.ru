# require './my_sinatra'
# require './my_sinatra'
#
# run my_sinatra::Application

# 3 stage - module run
root = File.expand_path File.dirname(__FILE__)
require File.join( root , 'my_sinatra.rb' )

app = Rack::Builder.app do
  run MyAppModule::App
end

run app