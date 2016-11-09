class Admin::AdsController < AdminController

  def index
    @ads = Ad.all.order("created_at DESC")
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    if @ad.save
      redirect_to @ad
    else

    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update(ad_params)
    redirect_to ad_path(@ad)
  end

  def destroy
    @ad = Ad.find(params[:id])

    @ad.destroy

    redirect_to admin_ads_path
  end

  def stop_ad
    @ad = Ad.find(params[:id])

    if @ad.active?
      @ad.active = false
    else
      @ad.active = true
    end

    @ad.save

    redirect_to admin_ads_path
  end

  def was_paid
    @ad = Ad.find(params[:id])

    @ad.paid = true

    @ad.save

    redirect_to admin_ads_path
  end

  protected

  def ad_params
    params.require(:ad).permit(:title, :phone, :phone_additional, :price, :email, :website, :description, ad_photos_attributes: [:id, :image, :_destroy])
  end

end
