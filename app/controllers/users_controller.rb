class UsersController < ApplicationController


  def show
    @user = User.new
    @user = @user.find(params:[:id])
  end

end
