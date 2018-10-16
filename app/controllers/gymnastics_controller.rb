class GymnasticsController < ApplicationController
before_action :set_gymnastic, only: [:show, :update, :destroy]

  # GET /gymnastics
  def index
    @gymnastics = Gymnastic.all

    render json: @gymnastics
  end

  # GET /gymnastics/1
  def show
    render json: @gymnastic
  end

  # POST /gymnastics
  def create
    @gymnastic = Gymnastic.new(gymnastic_params)

    if @gymnastic.save
      render json: @gymnastic, status: :created, location: @gymnastic
    else
      render json: @gymnastic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gymnastics/1
  def update
    if @gymnastic.update(gymnastic_params)
      render json: @gymnastic
    else
      render json: @gymnastic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gymnastics/1
  def destroy
    @gymnastic.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gymnastic
    @gymnastic = Gymnastic.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gymnastic_params
    params.require(:gymnastic).permit(:name, :date, :location, :user_id)
  end
end
