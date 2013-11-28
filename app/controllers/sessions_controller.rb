class SessionsController < ApplicationController
  def new
  end
  def create
    	user = User.authenticate(params[:nickname], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_path, notice: '¡Bienvenido!'
  	else
  		flash.now.alert = 'Error en mote y/o contraseña'
      render 'new'
  	end
  end
  
  def createwithFacebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end
    def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end