class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!

  before_action do
    check_admin
  end

  def index
    matches_index = Match.all
    @matches = matches_index.group_by(&:day)
  end

  def create
    Match.removeMatches(params[:day])
    Match.couplesForCourseday(params[:day])
    redirect_to admin_matches_path, notice: "Matches created"
  end

  def delete
    Match.removeMatches(params[:day])
    redirect_to admin_matches, notice: "Matches deleted"
  end

  def check_admin
    redirect_to "/", alert: 'This page is for Teachers & Staff only.' unless current_user.is_admin
  end

end
