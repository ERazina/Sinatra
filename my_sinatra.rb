require 'sinatra'

# 2-nd stage namespace
require 'sinatra/namespace'

# 3 stage - module run
require 'sinatra/base'

module MyAppModule  # 3 stage - module run
  class App < Sinatra::Base  # 3 stage - module run
    register Sinatra::Namespace   # 3 stage - module run

    # 1 main style
    get '/' do # Outside namespace
      'Hello My my_sinatra - Easy and Wide world!'
    end

    # 4 stage Routes - redirect
    # get '/' do
    #   "This route is fired"
    #   redirect to('/hello/World')
    # end

    get %r{/hello/([\w]+)} do |c|
      "Hello, #{c}!"
    end

    # 2 params
    get "/hello/:name" do # Outside namespace
      # соответствует "GET /hello/foo" и "GET /hello/bar",
      # где params['name'] 'foo' или 'bar'
      "my_sinatra приветствует тебя, #{params[:name]}!"
    end

    namespace '/api/v1' do # Inside namespace 2-nd stage namespace
      get "/*" do
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
    end

  end  # 3 stage - module run
end  # 3 stage - module run



