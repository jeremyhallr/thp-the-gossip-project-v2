class SessionsController < ApplicationController
  def new
   @gossip_sample = Gossip.all.sample
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      flash[:success] = "Connexion réussie "
      log_in(user)
      remember(user)
      redirect_to gossips_path
    else
      flash.now[:danger] = "Email et/ou mot de passe invalide"
      render :new
    end
  end

  def destroy
    log_out(current_user)
    flash[:success] = "Déconnexion réussie"
    redirect_to new_session_path
  end
end
