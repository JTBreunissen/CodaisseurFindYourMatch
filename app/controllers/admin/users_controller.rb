class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  attr_accessor :is_admin

  def index
    @users = User.all
    @students = []
    @users.each do |student|
      @students << student.name if !student.is_admin?
    end
  end

  def update
    debugger
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :admin_users, notice: "Admin status updated"
    else
      redirect_to 'pages#home'
    end
  end

end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_admin)
  end
