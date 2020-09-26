class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
  end
  get '/' do 

    erb :'/login'
  
  end

  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
    end

    def login(email, password)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)    
      session[:user_id] = user.id
      redirect '/artists/index'
      else 
        redirect '/login'
    end
  end

    def logout!
      session.clear
    end
  end

end