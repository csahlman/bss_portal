class ClassSignupsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.add_instructor(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.remove_instructor(@user)
  end
end