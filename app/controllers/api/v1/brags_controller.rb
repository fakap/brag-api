class Api::V1::BragsController < Api::V1::BaseController
  before_action :find_brag, only: [:show, :update, :destroy]
  before_action :find_brags, only: [:index]

  def index
    if @current_user == @brags_owner
      render json: ActiveModel::ArraySerializer.new(
        @brags,
        each_serializer: Api::V1::BragSerializer,
        root: :brags,
      )
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  def show
    if @current_user == @brag.user
      render json: Api::V1::BragSerializer.new(@brag)
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
    if @current_user == @brag.user
      brag_update_service = UpdateBragService.new(@brag, safe_params)
      @brag = brag_update_service.call
      if @brag.valid?
        render json: Api::V1::BragSerializer.new(@brag)
      else
        render json: { errors: @brag.errors.messages }, status: 400
      end
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  def destroy
    if @current_user == @brag.user
      brag_destruction_service = DeleteBragService.new(@brag)
      brag_destruction_service.call
      render json: {}, status: 200
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  private

    def safe_params
      params.permit(:id, :title, :story, :photo)
    end

    def find_brag
      @brag = Brag.find(params[:id])
    end

    def find_brags
      @brags_owner = User.find(params[:id])
      @brags = @brags_owner.brags
    end
end
