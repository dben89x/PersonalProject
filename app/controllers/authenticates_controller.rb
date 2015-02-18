class AuthenticatesController < PublicController

  def signin
    @signin = true
    unless current_user
      render template: 'users/signin'
    else
      redirect_to main_path, notice: "You're already signed in"
    end
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to main_path, notice: "Welcome back, #{@user.first_name}"
    else
      @sign_in_error = "Username / password combination is invalid"
      render 'users/signin'
    end
  end

  def destroy
    session.clear
    redirect_to main_path, notice: 'You have successfully signed out'
  end

end
