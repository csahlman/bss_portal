class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper
  
  before_filter :authenticate

  before_filter :only_active_users

  private

    def only_active_users
      redirect_to recover_account_path
    end

end
