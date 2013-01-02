class PagesController < ApplicationController

  def home
    @semester = Semester.includes(days: :lessons).first
    if params[:track]
      @track = Track.where(name: params[:track]).first      
    end  
    @development = Track.where(name: "Development").first
    @product = Track.where(name: "Product").first
    @marketing = Track.where(name: "Marketing").first
    @sales = Track.where(name: "Sales").first
  end

  def index
    @semester = Semester.first
    @lesson = Lesson.last
  end

end