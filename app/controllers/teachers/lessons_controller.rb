class Teachers::LessonsController < Teachers::BaseController
  before_filter :must_be_teaching

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  private

    def must_be_teaching
      @lesson = Lesson.find(params[:id])
      redirect_to root_path, flash: { error: "No Access" } unless
        current_user.teaching?(@lesson.id) || current_user.admin?
    end
end