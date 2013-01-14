class Admin::LessonsController < Admin::BaseController

  def new
    @lesson = Lesson.new
    @semester = Semester.find(params[:semester_id])
    @templates = Lesson.saved
  end

  def create
    @lesson = Lesson.new
    @semester = Semester.find(params[:semester_id])
    @lesson_template = LessonTemplate.find(params[:lesson][:lesson_template_id])
    @day_id = params[:lesson][:day_id]
    @day = Day.find(@day_id)
    @lesson = Lesson.create_clone(@lesson_template, @day)
    # @lesson.add_date(params[:lesson][:date])
    @lesson.save!
    redirect_to edit_admin_semester_path(@semester)
  end

  def show
    @semester = Semester.find(params[:semester_id]) if params[:semester_id]
    @lesson = Lesson.includes(:attachments, :images, :users, :day).find(params[:id])
  end

  def index
    @lessons = Lesson.all
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @semester = Semester.find(params[:semester_id])
    if params[:content]
      @lesson.description = Lesson.parse_json(params[:content])
    else
      @lesson.set_parameters(params[:lesson])
      track_ids = params[:lesson][:track_ids].map { |id| id.to_i }
      track_ids.delete(0)
      @tracks = Track.find(track_ids)
      @lesson.tracks = @tracks
      day_ids = params[:lesson][:day_ids].map { |id| id.to_i }
      day_ids.delete(0)
      @days = Day.find(day_ids)
      # this is a bug with rails 
      @lesson.days = @days
      # @lesson.add_date(params[:lesson][:date])
    end
    if @lesson.save
      redirect_to [:admin, @semester, @lesson], flash: { success: "updated successfully" }
    else
      render 'edit'
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
  end

  def lesson_info
    @lesson = Lesson.includes(:users).find(params[:id])
  end


end