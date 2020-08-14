class DogsController < ApplicationController

  before_action :check_if_logged_in

  def new
    # only owners can create a new dog
    @dog = Dog.new
  end

  def create
    dog = Dog.create dog_params
    @current_user.owned_dogs << dog   # association
    redirect_to home_path
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

  def add_dog_to_walker
    redirect_to(home_path) and return unless @current_user.walker?
    @dogs = Dog.all - @current_user.walked_dogs
  end

  def process_add_dog_to_walker
    redirect_to(home_path) and return unless @current_user.walker?
    @current_user.walked_dogs << Dog.find(params[:dog_id])
    redirect_to home_path
  end

 #User.last.walked_dogs.delete Dog.find(19)
  private

  def dog_params
    params.require(:dog).permit( :name, :breed, :bio, :image )
  end # dog_params

end
