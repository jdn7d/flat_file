class SessionsController < ApplicationController


    get '/signup' do
        erb :signup # #users/new
    end

    get '/login' do 
        erb :login
    end

    post "/sessions" do 
        #login a user with this email
        login(params[:email], params[:password])
        redirect '/artists/index'
    end

    get '/logout' do 
    logout!
        redirect '/login'
    end
end