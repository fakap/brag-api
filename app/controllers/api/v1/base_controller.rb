class Api::V1::BaseController < ApplicationController
  before_action :destroy_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def destroy_session
    request.session_options[:skip] = true
  end

  def not_found
    return api_error status: 404, errors: 'Not found'
  end
end
