class Admin::DashboardController < Admin::BaseController

  def show
    @tracks = Track.all
    @semester = Semester.includes(lesson_days: { lessons: :tracks } ).first    
  end

end