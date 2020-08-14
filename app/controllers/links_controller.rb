class LinksController < ApplicationController

def link_dog # link the walker to the dog that was created by the owner.
  dog = Dog.find params[:id]
  user = User.find session[:id]
  dog.users << user
  redirect_to home_path # redirect back to the walker's home page.
end #link dog

end
