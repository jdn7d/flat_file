class UserController < ApplicationController


   

    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        @user.name = params[:name]
        if @user.save
            redirect '/login'
        else
            erb :signup #users/new
        end
    end
end