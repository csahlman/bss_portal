class Teachers::BaseController < ApplicationController
  before_filter :must_be_a_teacher

  private

    def must_be_a_teacher
      redirect_to root_path, flash: { error: "No Access" } unless 
        current_user.admin? || current_user.confirmed_teacher?
    end
end