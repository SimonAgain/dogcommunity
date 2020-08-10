class ApplicationController < ActionController::Base

  before_action :fetch_user  # place here because all controllers inherit this.

  #before action runs before each method called.

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id] # find_by vs find.. find_by returns nil rather than a show stopping error like find does.
    end # if

    unless @current_user.present? #(ie. if it's nil)
      session[:user_id] = nil
    end# unless

  end # fetch_user

  def check_if_logged_in
    # If the current browser user is not logged in,
    # this method redirects them to the login page;
    # we can call this method for any specific controller
    # actions that require a user to be logged in, to
    # lock down those routes.
    redirect_to login_path unless @current_user.present?
  end #check_if_logged_in
end
