class Admin::ActivitiesController < Admin::BaseController

  def new
    @period = Period.find(params[:period_id])
  end

  def create
    @period = Period.find(params[:period_id])
    @activity = @period.activities.new
    @activity.activity = params[:activity][:activity]
    @activity.save!
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

end