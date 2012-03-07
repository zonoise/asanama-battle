class Admin::BattlesController < ApplicationController
  layout 'admin' 
  def index
    @battles=Battle.find(:all)
  end

  def show
    
  end

  def new
    @battle = Battle.new
  end

  def create
    battle = Battle.new(params[:battle])
    if battle.save
      redirect_to :action=>:index
    else
      #todo 
    end

  end

  def edit
    @battle = Battle.find(params[:id])
    render :new
  end

  def update
    @battle = Battle.find(params[:id])
    if @battle.update_attributes(params[:battle])
      redirect_to :action => :index
    else

    end
  end

  def destroy
    #todo　子も消す？
    @battle = Battle.find(params[:id])
    if @battle.destroy
      redirect_to :action => :index
    else
      #todo 
    end
  end

end
