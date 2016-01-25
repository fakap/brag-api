class Api::V1::CommentsController < Api::V1::BaseController
  before_action :find_brag, except: [:destroy]
  before_action :find_comment, only: [:destroy]

  def index
    render json: ActiveModel::ArraySerializer(
      @brag.comments,
      each_serializer: Api::V1::CommentSerializer,
      root: false
    )
  end

  def create
    comment = @brag.comments.build(user_id: current_user.id, text: params[:text])
    if comment.save
      render json: Api::V1::CommentSerializer.new(comment), status: 201
    else
      render json: { errors: comment.errors.messages }, status: 400
    end
  end

  def destroy
    if current_user == @comment.user
      @comment.destroy
      render json: {}
    else
      render json: { errors: 'Unauthorized' }, status: 403
    end
  end

  private

    def find_brag
      @brag = Brag.find(params[:id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
end
