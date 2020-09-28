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
            @artist = Artist.find(params[:artist_id])
            erb :'artworks/new'
        end
    end

    post '/artworks' do 
        @artwork = Artwork.new(title: params[:title],medium: params[:medium], location: params[:location], notes: params[:notes])
        @artist = Artist.find(params[:artist_id])
        @artist.artworks << @artwork 
        if @artwork.save
        erb :'artists/show'
        else
            erb :'artworks/new'
        end
    end

    get '/artworks/:id' do
       
        end
end