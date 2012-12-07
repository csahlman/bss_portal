class Admin::DashboardController < Admin::BaseController

  def show
    @development = Track.includes(:lessons).find_by_name("Development")
    @marketing = Track.includes(:lessons).find_by_name("Marketing")
    @product = Track.includes(:lessons).find_by_name("Product")
    @sales = Track.includes(:lessons).find_by_name("Sales")
    @semester = Semester.first    
  end

end