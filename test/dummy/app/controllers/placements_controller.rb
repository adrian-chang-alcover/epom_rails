class PlacementsController < ApplicationController
  before_action :set_placement, only: [:show, :edit, :update, :destroy]

  # GET /placements
  def index
    @placements = Placement.all
  end

  # GET /placements/1
  def show
  end

  # GET /placements/new
  def new
    @placement = Placement.new
  end

  # GET /placements/1/edit
  def edit
  end

  # POST /placements
  def create
    @placement = Placement.new(placement_params)

    if @placement.save
      redirect_to @placement, notice: 'Placement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /placements/1
  def update
    if @placement.update(placement_params)
      redirect_to @placement, notice: 'Placement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /placements/1
  def destroy
    @placement.destroy
    redirect_to placements_url, notice: 'Placement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_placement
      @placement = Placement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def placement_params
      params.require(:placement).permit(:epom_id, :zone_id, :type, :name, :ad_unit_id, :size_height, :size_width)
    end
end
