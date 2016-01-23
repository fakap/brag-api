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
    brag = Brag.find(params[:id])
    if @current_user == brag.user
      render json: Api::V1::BragSerializer.new(brag)
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
