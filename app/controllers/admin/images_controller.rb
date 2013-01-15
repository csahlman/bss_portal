class Admin::ImagesController < Admin::BaseController

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @images = @lesson.images
  end


  def create
    if params[:lesson_id]
      @lesson = Lesson.find(params[:lesson_id])
      @image = @lesson.images.new(params[:image])
      if @image.save
        redirect_to admin_lesson_images_path(@lesson),
          flash: { success: "Created image" }
      else
        render 'index'
      end
    else
      @lesson_template = LessonTemplate.find(params[:lesson_template_id])
      @image = @lesson_template.images.new(params[:image])
      if @image.save
        redirect_to [:edit, :admin, @lesson_template], flash: { success: "Created image" }
      else
        render 'new'
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
  end

end