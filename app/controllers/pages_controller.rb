class PagesController < ApplicationController

  before_action :check_if_logged_in, only: [ :home ]
  
  def welcome
  end

  def home
    @u_id = session[:user_id]
  end
end
