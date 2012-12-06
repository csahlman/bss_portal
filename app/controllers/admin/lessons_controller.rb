class Admin::LessonsController < Admin::BaseController

  def new
    
  end

  def create
    @lesson = Lesson.new
    @lesson.summary = params[:lesson][:summary]
    @lesson.track_id = params[:lesson][:track_id]
    @lesson.description = params[:lesson][:description]
    @lesson.lesson_day_id = params[:lesson][:lesson_day_id]
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
    
  end


end