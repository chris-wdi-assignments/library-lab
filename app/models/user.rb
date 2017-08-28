class User < ApplicationRecord
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    # if we found a user, return whether or not they're authenticated, else F
    @user ? @user.authenticate(params[:password]) : false
  end

end
