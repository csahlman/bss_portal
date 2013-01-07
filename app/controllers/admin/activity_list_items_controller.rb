class Admin::ActivityListItemsController < Admin::BaseController

  def new
    @activity = Activity.find(params[:activity_id])    
  end

  def create
    @activity = Activity.find(params[:activity_id])  
    @list_item = @activity.activity_list_items.new
    @list_item.list_item = params[:activity_list_item][:list_item]
    @list_item.save!
  end

end