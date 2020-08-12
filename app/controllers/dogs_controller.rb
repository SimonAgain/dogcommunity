class DogsController < ApplicationController

  def new
    # only owners can create a new dog
    @dog = Dog.new
  end

  def create
    dog = Dog.create dog_params
    owner = User.find session[:user_id]
    dog.users << owner   # association
    redirect_to user_path(owner)
  end # create

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def dog_params
    params.require(:dog).permit( :name, :breed, :bio, :image )
  end # dog_params

end
