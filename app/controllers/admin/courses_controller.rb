class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  before_action do
    check_admin
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to :admin_courses, notice: "Course successfully created"
    else
      render :new
    end
  end

  def destroy
    @course.destroy
    redirect_to :admin_courses, :notice => "Course has been deleted"
  end

  private

  def course_params
    params.require(:course).permit(:name, :amount_of_days, :start_date, :end_date)
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def check_admin
    redirect_to "/", alert: 'This page is for Teachers & Staff only.' unless current_user.is_admin
  end
end
