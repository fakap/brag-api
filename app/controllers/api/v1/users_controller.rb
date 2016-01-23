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
    if user.valid?
      render json: Api::V1::UserSerializer.new(user), status: 201
    else
      render json: { errors: user.errors.messages }, status: 400
    end
  end

  def update
  end

  def destroy
  end

  private

    def safe_params
      params.permit(:id, :first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
