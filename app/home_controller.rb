require 'sinatra/base'

# This class exposes the supported vehicle APIs
class HomeController < Sinatra::Base
    # This will just redirect the user to the docs website.
    get '/' do
        redirect "http://leok.me/backend-code-challenge/"
    end
end
