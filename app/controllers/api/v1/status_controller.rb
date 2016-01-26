class Api::V1::StatusController < Api::ApiController
  before_action :authenticate
  before_action :set_storage

  def index
    render json: {status: 200}
  end

  def create
    @storage.push params
    render json: {status: 200}
  end

  private

  def set_storage
    @storage = Storage.new
  end
end
