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

end