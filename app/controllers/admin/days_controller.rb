class Admin::DaysController < Admin::BaseController

  def create
    @semester = Semester.find(params[:semester_id])
    @day = @semester.days.new
    @day.date = params[:day][:date]
    @day.day_value = params[:day][:day_value]
    @day.save!
  end

  def destroy
    @day = Day.find(params[:id])
    @day.destroy
  end

end