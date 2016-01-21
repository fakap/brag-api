class Api::V1::BaseController < ApplicationController
  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end
end
