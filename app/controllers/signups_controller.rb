class SignupsController < ApplicationController 

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.add_user(current_user)  
  end  

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.remove_user(current_user)
  end

end