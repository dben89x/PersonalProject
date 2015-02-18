class RegistersController<PublicController

  def signup
    @signup = true
    @user = User.new
    render :template => 'users/signup'
  end

  def create
    skip_before_action :ensure_logged_in
    session[:user_id] = @user.id
    @user = User.new(user_params)
    if @user.save
      redirect_to main_path, notice: "Thanks, #{@user.first_name}. You have successfully signed up!"
    else
      render 'users/signup'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
