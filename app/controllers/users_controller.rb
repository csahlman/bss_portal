class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.set_user_attributes(params[:user])
    if @user.save
      redirect_to root_path, flash: { success: "Updated successfully" }
    else
      render 'edit'
    end
  end

end