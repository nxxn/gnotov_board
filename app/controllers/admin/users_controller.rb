class Admin::UsersController < AdminController

  def index
    @users = User.all.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else

    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to admin_users_path
  end

  def stop_user
    @user = User.find(params[:id])

    if @user.active?
      @user.active = false
    else
      @user.active = true
    end

    @user.save

    redirect_to admin_users_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :active, :dealer)
  end

end
