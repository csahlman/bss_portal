class Admin::IncrementListsController < Admin::BaseController

  def create
    @lesson_template = LessonTemplate.find(params[:lesson_id])
    @list_class = params[:list_type]
    @list_item = @list_class.classify.constantize.find(params[:id])
    @list_item.move_higher
    redirect_to [:edit, :admin, @lesson_template], flash: { success: "Updated list" }
  end

end