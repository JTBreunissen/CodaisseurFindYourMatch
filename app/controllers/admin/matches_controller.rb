class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = Match.all
  end

  def create
    Match.couplesForCourseday(params[:day])
  end

end
