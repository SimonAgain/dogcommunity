class DogsController < ApplicationController
  
  def new
  end

  def create
  end

  def index
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
end
