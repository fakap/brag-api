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
    brag_creation_service = CreateBragService.new(safe_params)
    brag = brag_creation_service.call
    if brag.persisted?
      render json: Api::V1::BragSerializer.new(brag), status: 201
    else
      render json: { errors: brag.errors.messages }, status: 400
    end
  end

  def update
  end

  def destroy
  end
end
