class UpdateUserService

  def initialize user, new_attributes
    @user = user
    new_attributes[:password_confirmation] ||= '' if new_attributes[:password]
    @user.assign_attributes(new_attributes)
  end

  def call
    @user.save
    @user
  end
end
