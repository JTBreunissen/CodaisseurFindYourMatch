class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = Courseday.all
  end

  def create
    @match = matches.build(match_params)
    if @match.save
      redirect_to edit_match_path(@match), notice: "Daily matches successfully created"
    else
      render :new
    end
  end

end
