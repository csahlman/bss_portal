class Admin::LessonsController < Admin::BaseController

  def new
    @lesson = Lesson.new
    @semester = Semester.find(params[:semester_id])
    @templates = Lesson.saved
  end

  def create
    @lesson = Lesson.new
    @semester = Semester.find(params[:semester_id])
    if params[:lesson][:lesson_id]
      @cloned = Lesson.find(params[:lesson][:lesson_id])
      @lesson.set_cloned_parameters(params[:lesson], @cloned)
    else
      @lesson.set_parameters(params[:lesson])
      track_ids = params[:lesson][:track_ids].map { |id| id.to_i }
      track_ids.delete(0)
      @tracks = Track.find(track_ids)
      @lesson.tracks = @tracks
    end
    day_ids = params[:lesson][:day_ids].map { |id| id.to_i }
    day_ids.delete(0)
    @days = Day.find(day_ids)
    # this is a bug with rails 
    @lesson.days = @days
    # @lesson.add_date(params[:lesson][:date])
    @lesson.save!
    redirect_to admin_semester_lesson_path(@semester, @lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
    @semester = Semester.find(params[:semester_id])
  end

  def index
    @lessons = Lesson.all
  end

  def edit
    @semester = Semester.find(params[:semester_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.description = Lesson.parse_json(params[:content])
    @lesson.save!
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
  end


end