class PanelistsController < ApplicationController
  def index
    @panelists = Panelist.where(:battle_id=>params[:battle_id])
  end

  def show
  end

  def good
    battle_id=params[:battle_id].to_i
    panelist_id=params[:id].to_i
    user_id=1 #todo
    #todo UserがVoteできるかチェック

    round = Round.now(battle_id).first
    logger.debug(round)
    if vote = Vote.create(:user_id=>user_id ,:round_id => round.id ,:panelist_id=>panelist_id,:kind=>1)
    Panelist.find(panelist_id).update_good
    Panelist.find(panelist_id).update_point
    RoundPoint.update_point(round.id,panelist_id)
    elsif
      logger.debug(vote)
      #todo
    end
  end

  def bad
    battle_id=params[:battle_id]
    panelist_id=params[:id]
    
    user_id=1 #todo
    #todo UserがVoteできるかチェック

    round = Round.now(battle_id)
    Vote.create(:user_id=>user_id ,:round_id => round.id ,:panelist_id=>panelist_id,:kind=>-1)
    Panelist.find(panelist_id).update_bad
    Panelist.find(panelist_id).update_point
    RoundPoint.update_point(round.id,panelist_id)
  end

  def point

  end
end
