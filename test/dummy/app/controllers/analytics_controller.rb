class AnalyticsController < ApplicationController
  before_action :set_analytic, only: [:show, :edit, :update, :destroy]

  # GET /analytics
  def index
    @analytics = Analytic.all
  end

  # GET /analytics/1
  def show
  end

  # GET /analytics/new
  def new
    @analytic = Analytic.new
  end

  # GET /analytics/1/edit
  def edit
  end

  # POST /analytics
  def create
    @analytic = Analytic.new(analytic_params)

    if @analytic.save
      redirect_to @analytic, notice: 'Analytic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /analytics/1
  def update
    if @analytic.update(analytic_params)
      redirect_to @analytic, notice: 'Analytic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /analytics/1
  def destroy
    @analytic.destroy
    redirect_to analytics_url, notice: 'Analytic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analytic
      @analytic = Analytic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def analytic_params
      params.require(:analytic).permit(:date, :hour, :advertiser, :advertiser_id, :campaign, :campaign_id, :banner, :banner_id, :site, :site_id, :zone, :zone_id, :placement, :placement_id, :channel, :country, :impressions, :clicks, :ctr, :conversions, :i2c, :ccr, :net, :gross, :profit, :ecpm_net, :ecpm_gross, :ecpm_profit, :status)
    end
end
