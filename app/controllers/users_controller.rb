class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [ :new, :create, :index ]

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.persisted?
      session[:user_id] = @user.id # logs in the newly created account automaticially.
      redirect_to root_path

    else
      render :new # show the form again directly, no redirect. It will contain the user details that are filled out correctly.
    end # if
  end # create

  def index
    @walkers = User.where user_type: 'walker'
  end

  def show
    @user = User.find params[:id]
    if @user.owner?
      render :owner_show
    else
      render :walker_show
    end
  end #show

  def edit
    @user =User.find params[:id]
  end

  def update
    user = User.find params[:id]

    if user!= @current_user
      redirect_to user_path
      return
    end

    user.update user_params
    redirect_to user_path
  end # update

  def destroy
  end

  private

  def user_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation, :user_type, :phone_no, :address, :bio, :image )
  end # user_params

end #UsersController
