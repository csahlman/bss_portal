class Admin::AttachmentsController < Admin::BaseController

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @attachments = @lesson.attachments
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