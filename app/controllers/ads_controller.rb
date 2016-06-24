class AdsController < ApplicationController
  def index
    @ads = Ad.page(params[:page]).per(10)
  end

  def show
    @ad = Ad.find params[:id]
    render :edit
  end

  def new
    @ad = Ad.new
    @ad.creatives.build
    @ad.targetings.build
  end

  def edit
    @ad = Ad.find params[:id]
  end

  def create
    @ad = Ad.new ad_params

    if @ad.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    @ad = Ad.find params[:id]

    if @ad.update ad_params
      redirect_to action: :index
    else
      render :edit
    end
  end

  private
    def ad_params
      params.require(:ad).permit(
        :budget,
        :creatives_attributes => [:id, :bid, :ad_text],
        :targetings_attributes => [:id, :places, :gender]
      )
    end
end
