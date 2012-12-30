class Admin::AttachmentsController < Admin::BaseController

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @attachments = @lesson.attachments
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @attachment = @lesson.attachments.new(params[:attachment])
    if @attachment.save
      redirect_to admin_semester_lesson_attachments_path(@semester, @lesson),
        flash: { success: "Created attachment" }
    else
      render 'index'
    end
  end

  def update
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @attachment = Attachment.find(params[:id])
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
  end

end