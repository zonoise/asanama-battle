class Admin::RoundsController < ApplicationController
  layout 'admin'
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

  #Create Maltiple Round
  def create_all

    start_time  =  parse_datetime(params[:create_all],'start_time')
    end_time    =  parse_datetime(params[:create_all],'end_time')
    round_min   =  params[:create_all][:round_min].to_i
    battle_id   =  params[:battle_id]
    logger.debug(start_time)
    round_start=start_time
    while round_start < end_time
      
      round_end = round_start.advance(:minutes=>round_min )
      logger.debug("round_start #{round_start} round_end#{round_end}")
      Round.create(:battle_id => battle_id,
                   :start=> round_start ,
                   :end=> round_end )
      round_start=round_end
    end
    redirect_to :action => :index
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

  private
  def parse_datetime(params,prefix)
    logger.debug(params)
    logger.debug(prefix)

    logger.debug [ params["#{prefix}(1i)"],params["#{prefix}(2i)"],
    params["#{prefix}(3i)"],params["#{prefix}(4i)"],
    params["#{prefix}(5i)"] ].to_s
    
    dt = DateTime.new(params["#{prefix}(1i)"].to_i,params["#{prefix}(2i)"].to_i,
                params["#{prefix}(3i)"].to_i,params["#{prefix}(4i)"].to_i,
                params["#{prefix}(5i)"].to_i)
    logger.debug(dt)
    return dt
  end
end
