class PagesController < ApplicationController
  skip_before_filter :authenticate_admin!, only: [ :home ]

  def home
    @tracks = Track.all
    @semester = Semester.includes(lesson_days: :lessons).first
  end

end