class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    matches_index = Match.all
    @matches = matches_index.group_by(&:day)
  end

  def create
    Match.removeMatches(params[:day])
    Match.couplesForCourseday(params[:day])
  end

end
