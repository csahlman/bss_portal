class Admin::ActivitiesController < Admin::BaseController

  def new
    @period = Period.find(params[:period_id])
  end

  def create
    @period = Period.find(params[:period_id])
    @activity = @period.activity.new
  end

end