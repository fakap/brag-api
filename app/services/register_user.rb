class RegisterUserService
  def initialize user_params
    @user = User.new(
      first_name:            user_params[:first_name],
      last_name:             user_params[:last_name],
      username:              user_params[:username],
      email:                 user_params[:email],
      password:              user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )
  end

  def call
    @user.generate_authentication_token!
    @user.save
  end
end
