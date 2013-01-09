class Admin::SemestersController < Admin::BaseController

  def index
    @semesters = Semester.all
  end

  def show
    @semester = Semester.includes(days: :lessons).find(params[:id])
    @tracks = Track.all
  end

  def new
    
  end

  def create
    @semester = Semester.new(params[:semester])
    if @semester.save
      redirect_to [:edit, :admin, @semester], flash: { success: "Created semester" }
    else
      render 'new'
    end
  end

  def edit
    @semester = Semester.find(params[:id])
    @tracks = Track.all
  end

  def update
    
  end

  def destroy
    
  end


end