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
    @lesson_template = LessonTemplate.includes(periods: :activities).find(params[:id])
  end

  def update
    @lesson_template = LessonTemplate.find(params[:id])
  end

  def index
    @lesson_templates = LessonTemplate.all
  end

  def destroy
    @lesson_template = LessonTemplate.find(params[:id])
    @lesson_template.destroy
  end

  def show
    @lesson_template = LessonTemplate.includes(:images, :attachments, periods: :activities).find(params[:id])
  end

end