class Api::V1::AuthenticationsController < Api::V1::BaseController
  def create
    user = User.find_by! email: params[:email]
    if user.authenticate params[:password]
      render json: {
        authentication_token: user.authentication_token,
        user: Api::V1::UserSerializer.new(user).to_json
      }
    end
    return api_error status: 403, errors: 'Unauthenticated'
  end
end
