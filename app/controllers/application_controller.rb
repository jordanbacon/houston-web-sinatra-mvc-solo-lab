class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        set :method_override, true
      end
    
      get '/' do
        # erb :welcome
        @puppy = Puppy.all
        erb :'puppy/index'
      end

   
end
