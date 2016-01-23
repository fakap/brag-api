class Api::V1::BragsController < Api::V1::BaseController

  def index
    user = User.find(params[:id])
    if @current_user == user
      brags = user.brags
      render json: ActiveModel::ArraySerializer.new(
        brags,
        each_serializer: Api::V1::BragSerializer,
        root: :brags,
      )
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
