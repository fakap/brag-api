class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate!, only: [:create]

  def index
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
