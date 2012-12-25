class RecoverAccountsController < ApplicationController
  skip_before_filter :authenticate
  skip_before_filter :only_active_users

  def new
    
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.update_attribute(:request_recover, true)
    else
      render 'new'
    end
  end

end