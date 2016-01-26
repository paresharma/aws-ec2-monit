class DashboardController < ApplicationController
  def index
    @storage = Storage.new

    render json: @storage.get_result
  end
end
