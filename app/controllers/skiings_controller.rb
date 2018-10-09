class SkiingsController < ProtectedController
  before_action :set_skiing, only: [:show, :update, :destroy]

  # GET /skiings
  def index
    @skiings = current_user.skiings.all

    render json: @skiings
  end

  # GET /skiings/1
  def show
    render json: @skiing
  end

  # POST /skiings
  def create
    @skiing = current_user.skiings.build(skiing_params)

    if @skiing.save
      render json: @skiing, status: :created
    else
      render json: @skiing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skiings/1
  def update
    if @skiing.update(skiing_params)
      render json: @skiing
    else
      render json: @skiing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /skiings/1
  def destroy
    @skiing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skiing
      @skiing = current_user.skiings.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
  def skiing_params
    params.require(:skiing).permit(:name, :date, :location)
  end
end
