class Admin::SemestersController < Admin::BaseController

  def index
    @semesters = Semester.all
  end

  def show
    @semester = Semester.includes(days: :lessons).find(params[:id])
    @development = Track.find_by_name("Development")
    @product = Track.find_by_name("Product")
    @marketing = Track.find_by_name("Marketing")
    @sales = Track.find_by_name("Sales")
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