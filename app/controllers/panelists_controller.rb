class PanelistsController < ApplicationController
  def index
    @panelists = Panelist.find(:all)
  end

  def show
  end

  def good
  end

  def bad
  end

  def point
  end
end
