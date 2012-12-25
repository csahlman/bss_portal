class LessonsController < ApplicationController
  skip_before_filter :authenticate

  def show
    @lesson = Lesson.find(params[:id])
  end

  def index
    @lessons = Lesson.all
  end
  
end