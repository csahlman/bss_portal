class PagesController < ApplicationController

  def home
    @semesters = Semester.all
  end

  def index
    @semester = Semester.first
    @lesson = Lesson.last
  end

end