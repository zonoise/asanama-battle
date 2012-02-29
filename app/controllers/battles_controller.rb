class BattlesController < ApplicationController
  def index
    @battles=Battle.find(:all)
  end

  def show
  end
end
