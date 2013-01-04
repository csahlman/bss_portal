class Admin::ObjectivesController < Admin::BaseController

  def create
    if params[:lesson_template_id]
      @lesson_template = LessonTemplate.find(params[:lesson_template_id])
      @objective = @lesson_template.objectives.new
    else
      @lesson = Lesson.find(params[:id])
      @objective = @lesson.objectives.new
    end
    @objective.objective = params[:objective][:objective]
    @objective.save!
  end

  def destroy
    @objective = Objective.find(params[:id])
    @objective.destroy
  end

end