class LessonUsersController < ApplicationController

  def create
    @lesson_user = LessonUser.new
    @lesson_user.user_id = current_user.id
    @lesson_user.lesson_id = params[:lesson_id]
    @lesson_user.save!
  end

  def destroy
    @lesson_user = LessonUser.find(params[:id])
    @lesson_user.destroy
  end

end