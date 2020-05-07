class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], age: params[:age], description: params[:description], password: params[:password], city: City.all.sample)

    if @user.save
      puts "Operation success"
      flash[:success] = "Création d'un nouveau profil "
      redirect_to login_path
    else
      puts "Failure"
      flash[:failure] = "Formulaire invalide"
      render :new
    end
  end

end
