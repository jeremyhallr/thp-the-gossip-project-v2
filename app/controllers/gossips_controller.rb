class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)

    if @gossip.save
      puts "Operation success"
      flash[:success] = "Création d'un potin "
      redirect_to new_session_path
    else
      puts "Failure"
      flash[:failure] = "Formulaire invalide"
      render :new
    end
  end

  def index
    @gossips = Gossip.all
  end

  def edit
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
      flash[:failure] = "Non autorisé"
      redirect_to gossips_path
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if current_user = @gossip.user
      if @gossip.update(title: params[:title], content: params[:text])
        redirect_to gossips_path
      else
        render :edit
      end
    else
      flash[:failure] = "Non autorisé"
      redirect_to gossips_path
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user = @gossip.user
      @gossip.destroy
      redirect_to gossips_path
    else
      flash[:failure] = "Non autorisé"
      redirect_to gossips_path
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Non connecté."
      redirect_to new_session_path
    end
  end
end