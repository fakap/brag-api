class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate!, only: [:create]

  def index
    users = User.all
    render json: ActiveModel::ArraySerializer.new(
      users,
      each_serializer: Api::V1::UserSerializer,
      root: :users,
    )
  end

  def show
    user = User.find_by! username: params[:username]
    render json: Api::V1::UserSerializer.new(user)
  end

  def create
    registration_service = RegisterUserService.new(safe_params)
    user = registration_service.call
    if user.persisted?
      render json: Api::V1::UserSerializer.new(user), status: 201
    else
      render json: { errors: user.errors.messages }, status: 400
    end
  end

  def update
    user = User.find safe_params[:id]
    if user == @current_user
      update_service = UpdateUserService.new(user, safe_params)
      user = update_service.call
      if user.valid?
        render json: Api::V1::UserSerializer.new(user)
      else
        render json: { errors: user.errors.messages }, status: 400
      end
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  def destroy
    user = User.find safe_params[:id]
    if user == @current_user
      delete_service = DeleteUserService.new(user)
      delete_service.call
      render json: {}
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  private

    def safe_params
      params.permit(:id, :first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
