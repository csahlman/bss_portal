class SemestersController < ApplicationController

  def index
    @semesters = Semester.all
  end

  def show
    @semester = Semester.find(params[:id])
    @tracks = Track.all
    if params[:track]
      @track = Track.find_by_name(params[:track])
    end
  end

end