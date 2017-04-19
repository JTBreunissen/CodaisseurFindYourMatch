class Admin::MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = Match.all
  end

  def create
    courseday = params[:day]
    Match.couplesForCourseday(courseday)
  end

end
