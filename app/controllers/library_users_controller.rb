class LibraryUsersController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
    @libraries = @user.libraries
  end

  def create
    @library = Library.find_by_id(params[:library_id])
    @library.users.push(current_user)
    redirect_to current_user
  end
end
