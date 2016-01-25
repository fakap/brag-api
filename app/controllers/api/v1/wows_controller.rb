class Api::V1::WowsController < Api::V1::BaseController
  before_action :find_brag

  def index
    render json: AciveMode::ArraySerializer(
      @brag.wows,
      each_serializer: Api::V1::WowSerializer,
      root: false
    )
  end

  def update
    wow = @brag.wows.find_by(user_id: current_user.id)
    if wow
      wow.destroy
      render json: {}
    else
      wow = @brag.wows.create(user_id: current_user.id)
      render json: { Api::V1::WowSerializer.new(wow) }, status: 201
    end
  end

  private

    def safe_params
      params.permit(:id)
    end

    def find_brag
      @brag = Brag.find(params[:id])
    end
end
