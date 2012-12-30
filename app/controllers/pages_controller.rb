class PagesController < ApplicationController

  def home
    @development = Track.where(name: "Development").first
    @product = Track.where(name: "Product").first
    @marketing = Track.where(name: "Marketing").first
    @sales = Track.where(name: "Sales").first
    @semester = Semester.includes(days: :lessons).first  
  end

  def index
    @semester = Semester.first
    @lesson = Lesson.last
  end

end