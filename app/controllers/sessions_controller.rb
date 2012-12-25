class SessionsController < ApplicationController
  skip_before_filter :authenticate

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_back_or root_url, flash: { notice: "Welcome #{user.name} " }
    else  
      flash.now[:error] = "Error logging in"
      render 'new'
    end
  end

  def new
    
  end

  def destroy
    sign_out
    redirect_to root_url, flash: { notice: "Logged out" }
  end
end