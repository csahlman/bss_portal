class LessonsController < ApplicationController
  skip_before_filter :authenticate_admin!

  def show
    @track = Track.find(params[:track_id])
    @lesson = Lesson.find(params[:id])
  end

  def index
    @lessons = Lesson.all
  end
  
end