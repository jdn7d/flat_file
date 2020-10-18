class UserController < ApplicationController

    get '/signup' do
        erb :signup #users/new
    end

    get '/login' do 
        if logged_in?
           redirect '/artists'
        else 
            erb :login
        end
    end

    post '/signup' do
         
        @user = User.create(name: params[:name], email: params[:email], password: params[:password])
        
        if @user.save
            session[:user_id] = @user.id
            
            redirect '/artists'
        else
            @errors = @user.errors.full_messages
            erb :signup #users/new
        end
    end
    

    post "/login" do 
        #login a user with this email
   
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])    
        session[:id] = user.id
        redirect '/artists'
        else 
        redirect '/login'
        end
    end
    
    get '/logout' do 
        if  logged_in? 
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end
end
