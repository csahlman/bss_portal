class Admin::LessonTemplatesController < Admin::BaseController

  def new
    
  end

  def create
    @lesson_template = LessonTemplate.new
    @lesson_template.set_attributes(params[:lesson_template])
  end

end