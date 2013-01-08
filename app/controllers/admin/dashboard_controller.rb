class Admin::DashboardController < Admin::BaseController

  def show
    @old_semesters = Semester.old
    @current_semesters = Semester.current
    # @lessons = Lesson.needs_approval
  end

end