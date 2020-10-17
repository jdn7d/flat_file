class ArtistController < ApplicationController

    get '/artists' do 
        if   !logged_in?
            redirect to '/login'
        else
            @artists = @current_user.artists
            erb :'/artists/index'       
        end
    end

    get '/artists/new' do 
        if !logged_in?
            redirect '/login' 
        else
            erb :'artists/new'
        end
    end
    
    post '/artists' do 
        if !logged_in?
            redirect to "/login"
        else
            @artist = Artist.new(name: params[:name],notes: params[:notes])    
            @current_user.artists << @artist 
        if
            @artist.save
            redirect "/artists/show"
        else 
            redirect to "/artists/new"
        end
        end
    end

    get '/artists/:id' do
        if !logged_in?
           redirect '/login' 
        else
            @artist = Artist.find_by(id: params[:id])
        end
        if @artist
        
            erb :'/artists/show'
        else
            redirect '/artists'
        end
    end

    get '/artists/:id/edit' do 
        if !logged_in?
            redirect '/login'
        end
        @artist = Artist.find(params[:id])
        if can_edit(@artist)
               erb :'artists/edit'
            else 
                redirect '/artists'
         
        end
    end

    patch '/artists/:id' do
        if !logged_in?
            redirect '/login'
        end
        @artist = Artist.find(params[:id])
           if can_edit(@artist)
          @artist.update(params[:artist])
            redirect to "/artists/#{@artist.id}"
        else
            redirect '/artists'
        end
            erb :"artists/edit"
    end

    delete '/artists/:id' do
        if !logged_in?
            redirect '/login'
        end
            @artist = Artist.find(params[:id])
        if  can_edit(@artist)
        @artist = Artist.delete(params[:id])
        redirect '/artists'
        else
            redirect '/artists' 
    end
    end
end