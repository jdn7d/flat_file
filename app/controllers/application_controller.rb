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
     if logged_in?
            redirect to "/artists"
     else   
    erb :'/login'
     end
  end

  helpers do 

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:id => session[:id]) if session[:id]
     
    end
    
    def login(email, password)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)    
        session[:id] = user.id
      else 
        redirect '/login'
      end
    end
    
  end
end