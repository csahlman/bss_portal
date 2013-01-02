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

  def edit
    @semester = Semester.find(params[:semester_id])
    @day = Day.find(params[:id])
  end

  def update
    @semester = Semester.find(params[:semester_id])
    @day = Day.find(params[:id])
    @day.date = params[:day][:date]
    @day.day_value = params[:day][:day_value]
    if @day.save
      redirect_to [:admin, @semester], flash: { success: "Edited day successfully" }
    else
      render 'edit'
    end
  end

end