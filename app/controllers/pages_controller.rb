class PagesController < ApplicationController

  before_action :check_if_logged_in, only: [ :home ]

  def welcome
  end

  def home
    @u_id = session[:user_id]

    # @user = User.find params[:id]
    # if @user.owner?
    #   render :owner_show
    # else
    #   render :walker_show
    # end
    
  end # home
end # PagesController
