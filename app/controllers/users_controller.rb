class UsersController < ApplicationController
  before_filter :must_be_self_or_admin


  def edit
  end

  def update
    @user.set_user_attributes(params[:user])
    if @user.save
      redirect_to root_path, flash: { success: "Updated successfully" }
    else
      render 'edit'
    end
  end

  def show
    @assigned_to_teach = @user.assigned_to_teach
    @teaching_lessons = Lesson.find(@user.teaching_ids)
  end

  private

    def must_be_self_or_admin
      @user = User.find(params[:id])
      redirect_to root_path, flash: { error: "You can't access that page" } unless
        current_user == @user || current_user.admin?
    end

end