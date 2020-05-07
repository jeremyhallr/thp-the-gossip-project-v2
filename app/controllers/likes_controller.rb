class LikesController < ApplicationController
  def new
  end

  def create
    @like = Like.new(user_id: current_user.id, gossip_id: params[:gossip_id])

    if @like.save
      puts "Operation success"
      flash[:success] = "Création d'un nouveau potin réussie"
      redirect_to gossips_path
    else
      puts "Failure"
      flash[:failure] = "Formulaire invalide"
      redirect_to gossips_path
    end
  end

  def index
  end

  def destroy
    @like = Like.find(params[:id])
    if current_user
      @like.destroy
      redirect_to gossips_path
    else
      flash[:failure] = "Non autorisé"
      redirect_to gossips_path
    end
  end
end
