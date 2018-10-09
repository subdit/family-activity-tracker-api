class SwimmingsController < ApplicationController
  before_action :set_swimming, only: [:show, :update, :destroy]

  # GET /swimmings
  def index
    @swimmings = Swimming.all

    render json: @swimmings
  end

  # GET /swimmings/1
  def show
    render json: @swimming
  end

  # POST /swimmings
  def create
    @swimming = Swimming.new(swimming_params)

    if @swimming.save
      render json: @swimming, status: :created, location: @swimming
    else
      render json: @swimming.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /swimmings/1
  def update
    if @swimming.update(swimming_params)
      render json: @swimming
    else
      render json: @swimming.errors, status: :unprocessable_entity
    end
  end

  # DELETE /swimmings/1
  def destroy
    @swimming.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimming
      @swimming = Swimming.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def swimming_params
      params.require(:swimming).permit(:name, :date, :location, :user_id)
    end
end
