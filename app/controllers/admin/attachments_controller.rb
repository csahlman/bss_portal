class Admin::AttachmentsController < Admin::BaseController

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @attachments = @lesson.attachments
  end

  def create
    if params[:lesson_id]
      @lesson = Lesson.find(params[:lesson_id])
      @attachment = @lesson.attachments.new(params[:attachment])
      if @attachment.save
        redirect_to admin_lesson_attachments_path(@lesson),
          flash: { success: "Created attachment" }
      else
        render 'index'
      end
    else
      @lesson_template = LessonTemplate.find(params[:lesson_template_id])
      @attachment = @lesson_template.attachments.new(params[:attachment])
      if @attachment.save
        redirect_to [:edit, :admin, @lesson_template], flash: { success: "Created Attachment" }
      else
        render 'edit'
      end
    end
    
    
    
  end

  def update
    @lesson = Lesson.find(params[:lesson_id])
    @attachment = Attachment.find(params[:id])
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
  end

end