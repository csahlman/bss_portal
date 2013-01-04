class Admin::LessonTemplatesController < Admin::BaseController

  def new
    
  end

  def create
    @lesson_template = LessonTemplate.new
    @lesson_template.set_attributes(params[:lesson_template])
    if @lesson_template.save
      redirect_to [:edit, :admin, @lesson_template], flash: { success: 
        "Keep building" }
    else
      render 'new'
    end
  end

  def edit
    @lesson_template = LessonTemplate.find(params[:id])
  end

  def update
    @lesson_template = LessonTemplate.find(params[:id])
  end

end