class Admin::PanelistsController < ApplicationController
  def index
    @panelists = Panelist.find(:all)
  end

  #GET /admin/panelists/1
  def show
  end

  #GET /admin/panelists/new
  def new
  end

  #POST /admin/panelists/create
  def create
    render :show
  end

  #GET /admin/panelists/edit
  def edit
  end

  #PUT /admin/panelists/1
  def update
  end

  #DELETE admin/panelists/1
  def destroy
  end

end
