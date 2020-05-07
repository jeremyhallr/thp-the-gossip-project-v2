class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(content: params[:content], user_id: current_user.id, gossip_id: params[:gossip_id])

    if @comment.save
      puts "Commentaire sauvegardé"
      redirect_to gossip_path(params[:gossip_id])
    else
      puts "Commentaire invalide"
      redirect_to gossips_path
    end
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:gossip_id])
    if @comment.update(content: params[:content])
      redirect_to gossip_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:gossip_id])
    @comment.destroy
    redirect_to gossip_path
  end
end