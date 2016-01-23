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
  end

  def create
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
