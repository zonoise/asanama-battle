class Admin::RoundsController < ApplicationController
  def index
    @rounds = Round.where('battle_id=?',params[:battle_id])
  end

  def show
  end

  def new
    @battle = Battle.find(params[:battle_id])
    @round = Round.new(:battle_id =>params[:battle_id])
  end

  def create
    @round = Round.new(params[:round])
    @round.battle_id = params[:battle_id]
    if @round.save
      redirect_to :action => :index
    else 
      render :new
    end 
  end

  def edit
    @battle = Battle.find(params[:battle_id])
    @round = Round.find(params[:id])
    render :new
  end

  def update
    @panelist = Round.find(params[:id])
    if @panelist.update_attributes(params[:panelist])
      redirect_to :action => :index
    else
    
    end
  end

  def destroy
    @panelist = Round.find(params[:id])
    if @panelist.destroy
      redirect_to :action => :index
    else
    end
  end

end
