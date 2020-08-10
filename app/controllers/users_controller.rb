class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [ :index ]

  def new
  end

  def create
  end

  def index
    @walkers = User.where user_type: 'walker'
  end

  def show
    @walker = User.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
