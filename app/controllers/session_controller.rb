class SessionController < ApplicationController

  def new

  end

  def create
    # 1. Check if the email address entered is acutally in the 'users' table.
    user = User.find_by email: params[:email]

    # 2. Did we find a user with that email address (or was it nil), and if we did find a user, is the password correct?
    if user.present? && user.authenticate( params[:password] )
      #credentials were correct - successful login.


      # get rails to create a new key/val pair in a special system variable called 'session'; this variable is remembered ACROSS REQUESTS (Unlike other controller variables.) This stateful/persists memory across requests is implemented using browser cookies: the server asks the browser to set them (in a response header) and the browser stores them, and presents them every future request to that same server (in a request header). ie. we can remember that a user has logged in.
      session[:user_id] = user.id

      redirect_to home_path
    else
      # either the user was nil (no such email address), or the password didn't match
      #unsuccessful login.

      #'Flash' hash is a bit like session in theat it is remembered ACROSS page requests.... but ONLY for One more page load, and then it disappears. This allows us to show error messages eg. on login forms, but not forever, only for the next page visit (ie. the redirect)
      flash[:error] = 'Invalid email or password'
      redirect_to login_path    # show the login form again to correct errors.
    end #if

  end # create

  def destroy

    session[:user_id] = nil   # This logs out the user.
    redirect_to root_path    # Go back to the login form page.

  end
end
