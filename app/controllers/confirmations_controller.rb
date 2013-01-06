class ConfirmationsController < ApplicationController
  before_filter :must_be_correct_user

  def create
    @lesson_user = @user.lesson_users.find_by_lesson_id(@lesson.id)
    @lesson_user.update_attribute(:confirmed, true) if @lesson_user
    redirect_to @user, flash: { success: "Confirmed signup for #{@lesson.title}" }
  end 

  private

    def must_be_correct_user
      @user = User.find(params[:user_id])
      @lesson = Lesson.find(params[:lesson_id])
      redirect_to root_path, flash: { error: "You can't do that" } unless 
        current_user == @user
    end

end