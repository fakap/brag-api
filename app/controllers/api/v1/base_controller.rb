class Api::V1::BaseController < ApplicationController
  before_action :destroy_session
  before_action :authenticate!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

    def authenticate!
      token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
      if token && options
        user = User.find_by(email: options[:email])
        if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
          return @current_user = user
        end
      end
      render json: { error: 'Unauthenticated' }, status: 401
    end

    def destroy_session
      request.session_options[:skip] = true
    end

    def not_found
      render json: { error: 'Not found' }, status: 404
    end
end
