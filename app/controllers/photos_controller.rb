class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    @user = User.find session[:user_id]
  end

  def create
    photo = Photo.create photo_params
    # user = User.find session[:user_id]
    redirect_to home_path
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit( :dog_id, :image )
  end # photo_params

end #PhotosController
