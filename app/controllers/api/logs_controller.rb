class Api::LogsController < ApplicationController
  def index
    render json: Log.rental_search(params[:column], params[:search])
  end

  def monthly_rental_trend
    render json: Log.monthly_rental_trend
  end

  def yearly_rental_trend
    render json: Log.yearly_rental_trend
  end
end
