class PuppiesController < ApplicationController
    
    #Index page => Displaying all the puppies
    get '/puppy' do
        @puppy = Puppy.all
        erb :'/puppy/index'
    end

    # New puppy
    get '/puppy/new' do
        erb :'puppy/new'
    end

    #Show Page => Display a single puppy
     get '/puppy/:id' do
        @puppy = Puppy.find(params[:id])
        erb :'puppy/show'
    end

    #Create a new puppy
    post '/puppy' do
        puppy = Puppy.create(params)
        redirect "/puppy/#{puppy.id}"
    end

    #Edit a puppy form
    get '/puppy/:id/edit' do
        @puppy = Puppy.find(params[:id])
        erb :'puppy/edit'    
    end

    #Edit a puppy
    patch '/puppy/:id' do
        puppy = Puppy.find(params[:id])
        puppy.update(name: params[:name], breed: params[:breed])
        redirect "/puppy/#{puppy.id}"
    end

    #Delete a puppy
    delete '/puppy/:id' do
        puppy = Puppy.find(params[:id])
        puppy.destroy 
        redirect '/puppy'
    end

end