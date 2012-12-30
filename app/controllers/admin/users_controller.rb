class Admin::UsersController < Admin::BaseController

  def new
    
  end

  def create
    @user = User.new
    @user.set_user_attributes(params[:user])
    @user.set_expiration_time
    @password = @user.set_random_password
    if @user.save
      # UserMailer.first_login(@user, @password).deliver
      # send an email using delayed job
      redirect_to admin_path, flash: { success: "created user" }
    else
      render 'new'
    end
  end

  def index
    if params[:lesson_id]
      @lesson = Lesson.find(params[:lesson_id])
      @users = @lesson.users
    else
      @to_reinstutute = User.requested_recover
      @inactive = User.inactive
      # paginate this?
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def make_active
    @user = User.find(params[:id])
    @user.activate
  end

end