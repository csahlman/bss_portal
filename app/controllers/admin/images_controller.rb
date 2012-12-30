class Admin::ImagesController < Admin::BaseController

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @images = @lesson.images
  end


  def create
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @image = @lesson.images.new(params[:image])
    if @image.save
      redirect_to admin_semester_lesson_images_path(@semester, @lesson),
        flash: { success: "Created image" }
    else
      render 'index'
    end
  end

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @image = Image.find(params[:id])
    @image.destroy
  end

end