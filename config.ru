# require File.dirname(__FILE__) # ?
# require_relative './boot'
# # require './boot.rb'
# require './api_sinatra_postgres.rb'
#
# require File.dirname(__FILE__) # ?

# Sinatra::Application.config_file File.join(File.dirname(__FILE__),
# Sinatra::Application.config.ru File.join(File.dirname(__FILE__),
#                                            'config',
#                                            "#{Sinatra::Application.settings.environment}_config.yml")

# run # Sinatra::Application


root = File.expand_path File.dirname(__FILE__)
require File.join( root , 'my_sinatra.rb' )

run Sinatra::Application

