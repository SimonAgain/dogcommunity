class PagesController < ApplicationController

  before_action :check_if_logged_in, only: [ :home ]

  def welcome
  end

  def home
    @u_id = session[:user_id]

    @user = User.find @u_id
    if @user.owner?
      render :owner_home
    else
      render :walker_home
    end

  end # home
end # PagesController
