class Admin::SignupsController < Admin::BaseController

  def create
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_user = @user.lesson_users.find_or_initialize_by_lesson_id(@lesson.id)
    @lesson_user.update_attribute(:assigned, true) if @lesson_user
    @lesson_user.update_attribute(:assigned_at_expiration, 36.hours.from_now) if @lesson_user
    UserMailer.delay.confirm_teaching(@user, @lesson)
    redirect_to [:admin, @user], flash: { success: "Signed #{@user.name} up for #{@lesson.to_s}" }
  end

  def destroy
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_user = @user.lesson_users.where(lesson_id: @lesson.id).last
    @lesson_user.destroy if @lesson_user
  end

end