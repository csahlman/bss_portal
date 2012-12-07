class Admin::LessonsController < Admin::BaseController

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new
    track_ids = params[:lesson][:track_ids].map { |id| id.to_i }
    track_ids.delete(0)
    # this is a bug with rails 
    @tracks = Track.find(track_ids)
    @lesson.summary = params[:lesson][:summary]
    @lesson.day_value = params[:lesson][:day_value]
    @lesson.description = params[:lesson][:description]
    @lesson.lesson_day_id = params[:lesson][:lesson_day_id]
    @lesson.tracks = @tracks
    @lesson.save!
    redirect_to admin_lesson_path(@lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def index
    @lessons = Lesson.all
  end

  def edit
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