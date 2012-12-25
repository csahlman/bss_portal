class Admin::UsersController < Admin::BaseController

  def new
    
  end

  def create
    @user = User.new
    @user.set_user_attributes(params[:user])
    if @user.save
      # send an email using delayed job
      redirect_to admin_dashboard_path, flash: { success: "created user" }
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
  
end