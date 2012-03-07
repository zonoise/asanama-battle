class Admin::PanelistsController < ApplicationController
  layout 'admin'
  def index
    @panelists = Panelist.where('battle_id=?',params[:battle_id])
  end

  #GET /admin/panelists/1
  def show
  end

  #GET /admin/panelists/new
  def new
    @battle = Battle.find(params[:battle_id])
    @panelist = Panelist.new(:battle_id =>params[:battle_id])
  end

  #POST /admin/panelists/create
  def create
    @panelist = Panelist.new(params[:panelist])
    @panelist.battle_id = params[:battle_id]
    if @panelist.save
      redirect_to :action => :index
    else 
      render :new
    end 
  end

  #GET /admin/panelists/edit
  def edit
    @battle = Battle.find(params[:battle_id])
    @panelist = Panelist.find(params[:id])
    render :new
  end

  #PUT /admin/panelists/1
  def update
    @panelist = Panelist.find(params[:id])
    if @panelist.update_attributes(params[:panelist])
      redirect_to :action => :index
    else
      #todo
    end
  end

  #DELETE admin/panelists/1
  def destroy
    @panelist = Panelist.find(params[:id])
    if @panelist.destroy
      redirect_to :action => :index
    else
    end
  end

end
