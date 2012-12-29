class Admin::ImagesController < Admin::BaseController

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @images = @lesson.images
  end

  def update
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @image = Image.find(params[:id])
  end

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @image = Image.find(params[:id])
    @image.destroy
  end

end