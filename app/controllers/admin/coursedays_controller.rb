class Admin::CoursedaysController < ApplicationController
  before_action :authenticate_user!

  def index
    @coursedays = Courseday.all
  end

  def new
    @courseday = courseday.build
  end

  def create
    @courseday = coursedays.build(courseday_params)
    if @courseday.save
      redirect_to edit_courseday_path(@courseday), notice: "Event successfully created"
    else
      render :new
    end
  end

end
