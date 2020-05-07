class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      flash[:success] = "Connexion réussie "
      session[:user_id] = user.id
      redirect_to gossips_path
    else
      flash[:success] = "Email et/ou mot de passe invalide"
      render :new
    end
  end

  def destroy
   session.delete(:user_id)
   flash[:success] = "Déconnexion réussie"
   redirect_to new_session_path
  end
end
