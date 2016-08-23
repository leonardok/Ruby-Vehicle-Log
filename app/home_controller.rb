require 'sinatra/base'

# This class exposes the supported vehicle APIs
class HomeController < Sinatra::Base
    # This will just redirect the user to the docs website.
    get '/' do
        redirect "http://leok.me/backend-code-challenge/"
    end

    get '/loaderio-c2db622309a20adaba9ae1264b6b581c/' do
        "loaderio-c2db622309a20adaba9ae1264b6b581c"
    end
end
