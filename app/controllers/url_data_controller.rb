class UrlDataController < ApplicationController
  before_action :set_url_datum, only: [:show, :update, :destroy]

  # GET /url_data
  # GET /url_data.json
  def index
    @url_data = UrlDatum.all.limit(5).desc(:hits)

    render json: @url_data
  end

  def get_total_hits
    @total_hits = UrlDatum.all.sum(:hits)
    
    render json: @total_hits
  end

  # GET /url_data/1
  # GET /url_data/1.json
  def redirect_short_url
    @url_datum = UrlDatum.where(short_url: params[:id]).first

    if @url_datum
      @url_datum.hits += 1
      @url_datum.save
      redirect_to @url_datum.get_complete_url, status: :moved_permanently
    else 
      render json: {}, status: :unprocessable_entity
    end
  end

  # POST /url_data
  # POST /url_data.json
  def create
    @url_datum = UrlDatum.new(long_url_datum_params)
    if @url_datum.save
      render json: @url_datum, status: :created, location: @url_datum
    else
      render json: @url_datum.errors, status: :unprocessable_entity
    end
  end

  private

    def set_url_datum
      @url_datum = UrlDatum.find(params[:id])
    end

    def long_url_datum_params
      params.require(:url_datum).permit(:long_url)
    end
end
