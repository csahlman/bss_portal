class Admin::PeriodsController < Admin::BaseController

  def create
    @lesson_template = LessonTemplate.find(params[:lesson_template_id])
    @period = @lesson_template.periods.new
    @period.start_time = params[:period][:start_time]
    @period.end_time = params[:period][:end_time]
    @period.save!
  end

  def destroy
    @period = Period.find(params[:id])
    @period.destroy
  end

end