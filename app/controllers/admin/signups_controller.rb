class Admin::SignupsController < Admin::BaseController

  def create
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_user = LessonUser.where('lesson_id = ? AND user_id = ?', params[:lesson_id],  params[:user_id]).last
    @lesson_user.update_attribute(:assigned, true) if @lesson_user
    @lesson.update_attribute(:assigned, true)
  end

  def destroy
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_user = @user.lesson_users.where(lesson_id: @lesson.id).last
    @lesson_user.update_attribute(:assigned, false)
    unless @lesson.multiple_teachers?
      @lesson.update_attribute(:assigned, false)
    end
  end

end