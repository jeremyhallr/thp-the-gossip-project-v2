class LikesController < ApplicationController
  def new
  end

  def create
    @like = Like.new(user: current_user.id, gossip: params[:id])

    if @Like.save
      puts "Operation success"
      flash[:success] = "Liké !"
      redirect_gossips_path
    else
      puts "Failure"
      flash[:failure] = "Like non pris en compte"
      redirect_gossips_path
  end

  def destroy
  end
end
