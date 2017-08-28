class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    # confirm that email/password combination is correct
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      flash[:error] = user_params
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to "/"
  end
end
