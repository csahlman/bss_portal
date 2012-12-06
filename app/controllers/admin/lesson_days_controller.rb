class Admin::LessonDaysController < Admin::BaseController

  def create
    @semester = Semester.find(params[:semester_id])
    @lesson_day = @semester.lesson_days.new
    @lesson_day.day_value = params[:lesson_day][:day_value]
    @lesson_day.save!
  end

  def update
    @lesson_day = LessonDay.find(params[:id])
    @lesson_day.day_value = params[:lesson_day][:day_value]
    @lesson_day.save!
  end

  def destroy
    @lesson_day = LessonDay.find(params[:id])
    @lesson_day.destroy
  end

end