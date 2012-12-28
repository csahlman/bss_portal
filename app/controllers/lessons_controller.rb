class LessonsController < ApplicationController

  def show
    @semester = Semester.find(params[:semester_id])
    @lesson = Lesson.find(params[:id])
  end

  def index
    @semester = Semester.find(params[:semester_id])
    @lessons = Lesson.all
  end
  
end