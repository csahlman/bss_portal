class PagesController < ApplicationController
  skip_before_filter :authenticate, only: [ :home ]

  def home
    @tracks = Track.includes(:lessons).all
    @semester = Semester.first    
  end

end