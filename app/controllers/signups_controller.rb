class SignupsController < ApplicationController 

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @semester = Semester.find(params[:semester_id])
    @lesson.add_user(current_user)
    redirect_to @semester, flash: { success: "Signed up for #{@lesson.title}" }  
  end  

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.remove_user(current_user)
  end

end