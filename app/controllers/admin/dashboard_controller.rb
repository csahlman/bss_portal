class Admin::DashboardController < Admin::BaseController

  def show
    @semesters = Semester.all
  end

end