class AdvertisersController < ApplicationController
  before_action :set_advertiser, only: [:show, :edit, :update, :destroy]

  # GET /advertisers
  def index
    @advertisers = Advertiser.all
  end

  # GET /advertisers/1
  def show
  end

  # GET /advertisers/new
  def new
    @advertiser = Advertiser.new
  end

  # GET /advertisers/1/edit
  def edit
  end

  # POST /advertisers
  def create
    @advertiser = Advertiser.new(advertiser_params)

    if @advertiser.save
      redirect_to @advertiser, notice: 'Advertiser was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /advertisers/1
  def update
    if @advertiser.update(advertiser_params)
      redirect_to @advertiser, notice: 'Advertiser was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /advertisers/1
  def destroy
    @advertiser.destroy
    redirect_to advertisers_url, notice: 'Advertiser was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertiser
      @advertiser = Advertiser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advertiser_params
      params.require(:advertiser).permit(:name, :contact_name, :contact_email, :description)
    end
end
