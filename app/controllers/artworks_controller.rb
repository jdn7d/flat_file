class ArtworkController < ApplicationController

    get '/artworks' do 
        if !logged_in?
         redirect to '/login'
        else
         @artworks = @current_user.artworks
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
        @artist = Artist.find(params[:artist_id])
        @artist.artworks.create(params[:artwork])
            redirect "artists/#{@artist.id}"   
    end

    #post '/artworks' do 
     #   @artist = Artist.find(params[:artist_id])
     #   params[:artist][:artworks].each do |details|
     #   Artwork.new(details)
     #   end
    #    redirect "artists/#{@artist.id}"   
    #end
    
    
    get '/artworks/:id' do
        if !logged_in?
            redirect '/login' 
         else
             @artwork = Artwork.find_by(id: params[:id])
         end
         if @artwork
         
             erb :'/artworks/show'
         else
             redirect '/artists'
         end
        end

         get '/artworks/:id/edit' do 
            @artwork = Artwork.find(params[:id])
            erb :'artworks/edit'
        end
    
        patch '/artworks/:id' do
            @artwork = Artwork.find(params[:id])
            if @artwork.update(params[:artwork])
                redirect to "/artworks/#{@artwork.id}"
            else
                erb :"artworks/edit"
            end
        end
    
        delete '/artworks/:id' do
            @artist = Artist.find(params[:artist_id])
            @artwork = Artwork.delete(params[:id])
            redirect to "/artists/#{@artist.id}"
           
        end

       
    end