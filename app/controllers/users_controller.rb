class UserController < ApplicationController

    get '/signup' do
        erb :signup #users/new
    end

    get '/login' do 
        if logged_in?
           redirect '/artists/index'
        else 
            erb :login
        end
    end

    post '/signup' do
            @user = User.new
            @user.email = params[:email]
            @user.password = params[:password]
            @user.name = params[:name]
    
        if  @user.save
            session[:user_id] = @user.id
            login(params[:email], params[:password])
            redirect '/artists/index'
        else
            erb :signup #users/new
        end
    end
    

    post "/login" do 
        #login a user with this email
        login(params[:email], params[:password])
        redirect '/artists/index'
    end
    
    get '/logout' do 
        if  logged_in? 
            logout!
            redirect '/login'
        else
            redirect '/'
        end
    end
end
