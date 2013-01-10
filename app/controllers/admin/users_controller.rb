class Admin::UsersController < Admin::BaseController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.set_user_attributes(params[:user])
    @user.set_expiration_time
    @password = @user.set_random_password
    if @user.save
      # @user.create_image!(picture: params[:user][:image])
      # UserMailer.delay.first_login(@user, @password)
      # send an email using delayed job
      redirect_to admin_path, flash: { success: "created user" }
    else
      render 'new'
    end
  end

  def index
    @user = User.new
    if params[:lesson_id]
      @lesson = Lesson.find(params[:lesson_id])
      @users = @lesson.users
    elsif params[:company]
      @users = User.where(company: params[:company])
    else
      @users = User.ordered_by_email.paginate(page: params[:page], per_page: 30)
      @to_reinstitute = User.requested_recover
      @inactive = User.inactive
    end
  end

  def update
    @user = User.find(params[:id])
    @user.set_user_attributes(params[:user])
    if @user.save
      redirect_to [:admin, @user], flash: { success: "Updated User" }
    else
      # render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
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