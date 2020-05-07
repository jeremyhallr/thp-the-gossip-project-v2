class SessionsController < ApplicationController
  def new
  end

  def create
    my_user = User.find_by(email: params[:email])

    if my_user.authenticate(params[:password])
      puts "!!!! YES !!!!"
      flash[:success] = "Connexion réussie "
      redirect_to login_path
    else
      puts "!!! NO !!! "
      flash[:success] = "Email et/ou mot de passe invalide "
      redirect_to login_path
    end
  end

  def destroy
  end
end
