class PagesController < ApplicationController

  def home
    @semesters = Semester.public
  end


end