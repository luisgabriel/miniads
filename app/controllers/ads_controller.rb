class AdsController < ApplicationController
  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = Ad.new(ad_params)

    if @ad.save
      redirect_to @ad
    else
      render 'new'
    end
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.update(ad_params)
      redirect_to @ad
    else
      render 'edit'
    end
  end

  private
    def ad_params
      params.require(:ad).permit(:budget)
    end
end
