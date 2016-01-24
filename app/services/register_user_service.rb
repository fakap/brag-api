class RegisterUserService

  def initialize user_attributes
    @user = User.new(
      first_name:            user_attributes[:first_name],
      last_name:             user_attributes[:last_name],
      username:              user_attributes[:username],
      email:                 user_attributes[:email],
      password:              user_attributes[:password],
      password_confirmation: user_attributes[:password_confirmation] || ''
    )
  end

  def call
    @user.generate_authentication_token!
    @user.save
    @user
  end
end
