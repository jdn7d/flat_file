class ArtworkController < ApplicationController

    get '/artworks' do 
        if !logged_in?
         redirect to '/login'
        else
         @artworks = Artworks.all
         erb :'artworks/index'       
        end
     end

    get '/artworks/new' do 
        if !logged_in?
            redirect '/login' 
        else
            @artworks = Artwork.all
            erb :'artworks/new'
        end
    end

    post '/artworks' do 
        @artwork = Artwork.new(params)
        @artwork.save
            erb :'/artworks/show'
    
        end
end