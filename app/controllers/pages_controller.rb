class PagesController < ApplicationController

  def home
    @tracks = Track.includes(:lessons).all
    @semester = Semester.first    
  end

end