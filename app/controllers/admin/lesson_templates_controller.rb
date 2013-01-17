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
    @lesson_template = LessonTemplate.includes(:images, :attachments, :objectives, periods: :activities).find(params[:id])
  end

  def update
    @lesson_template = LessonTemplate.find(params[:id])
    @lesson_template.set_attributes(params[:lesson_template])
    if @lesson_template.save
      redirect_to [:edit, :admin, @lesson_template], flash: { success: "Updated template" }
    else
      render 'edit'
    end
  end

  def index
    @lesson_templates = LessonTemplate.days
  end

  def destroy
    @lesson_template = LessonTemplate.find(params[:id])
    @lesson_template.destroy
    redirect_to admin_lesson_templates_path, flash: { success: "Deleted Template" }
  end

  def show
    @lesson_template = LessonTemplate.includes(:images, :attachments, periods: :activities).find(params[:id])
  end

  def toggle_default
    @lesson_template = LessonTemplate.find(params[:id])
    @lesson_template.toggle!(:default)
  end

end