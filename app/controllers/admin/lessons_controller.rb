class Admin::LessonsController < Admin::BaseController

  def new
    @lesson = Lesson.new
    @semester = Semester.find(params[:semester_id])
    @templates = Lesson.saved
  end

  def create
    @lesson = Lesson.new
    @lesson_template = LessonTemplate.find(params[:lesson][:lesson_template_id])
    @day = Day.find(params[:lesson][:day_id])
    @lesson = Lesson.create_clone(@lesson_template, @day)
    # @lesson.add_date(params[:lesson][:date])
    @lesson.save!
    # redirect_to edit_admin_semester_path(@day.semester)
  end

  def show
    @semester = Semester.find(params[:semester_id]) if params[:semester_id]
    @lesson = Lesson.includes(:attachments, :images, :users, :day).find(params[:id])
  end

  def index
    @semesters = Semester.includes(days: { lessons: :users }).all
    @lessons = Lesson.all
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.set_attributes(params[:lesson])
    if @lesson.save
      redirect_to [:edit, :admin, @lesson], flash: { success: "Updated Lesson" }
    else
      render 'edit'
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to admin_path, flash: { success: "Lesson Destroyed" }
  end

  def lesson_info
    @lesson = Lesson.includes(:users).find(params[:id])
  end


end