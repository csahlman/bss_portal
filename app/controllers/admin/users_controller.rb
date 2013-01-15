class Admin::UsersController < Admin::BaseController

  def new
    @user = User.new
    @user.email = params[:email] if params[:email]
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
      redirect_to [:admin, @user], flash: { success: "created user" }
    else
      render 'new'
    end
  end

  def index
    @user = User.new
    if params[:lesson_id]
      @lesson = Lesson.find(params[:lesson_id])
      @users = @lesson.users.sort_by(&:name)
    elsif params[:company]
      @users = User.where(company: params[:company])
    elsif params[:email_search]
      @users = User.email_search(params[:email_search]).paginate(page: params[:page], per_page: 20)
    elsif params[:name_search]
      @users = User.name_search(params[:name_search]).paginate(page: params[:page], per_page: 20)
    else
      @users = User.ordered_by_name.paginate(page: params[:page], per_page: 20)
      @to_reinstitute = User.requested_recover
      @inactive = User.inactive
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.set_user_attributes(params[:user])
    if @user.save
      redirect_to [:admin, @user], flash: { success: "Updated User" }
    else
      render 'edit'
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