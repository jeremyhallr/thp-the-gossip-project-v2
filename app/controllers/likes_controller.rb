class LikesController < ApplicationController
  def new
  end

  def create
    @like = Like.new(user_id: current_user.id, gossip_id: params[:gossip_id])

    if @like.save
      puts "Operation success"
      flash[:success] = "Like ajouté"
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
    @likes = Gossip.find(params[:id]).likes

    @likes.each do |like|
      if like.user == current_user
        flash[:success] = "Like supprimé"
        like.destroy
      end
    end
    redirect_to gossips_path
  end
end
