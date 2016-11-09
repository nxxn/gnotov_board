class AdsController < ApplicationController

  def index
    #@ads = Ad.all.order("created_at DESC")

    years_list
    capacity_list

    @filterrific = initialize_filterrific(
      Ad,
      params[:filterrific]
    ) or return
    @ads = @filterrific.find.page(params[:page])

    sap @ads

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @ad = Ad.new

    @ad.build_ad_tech_spec

    @ad.build_ad_seats_option
    @ad.build_ad_multimedia_option
    @ad.build_ad_driving_option
    @ad.build_ad_lights_option
    @ad.build_ad_safety_option
    @ad.build_ad_comfort_option
    @ad.build_ad_steering_option

    @car_makes = CarMake.all
    @car_models = CarModel.all

    generate_photos_token

    cities_list
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.active = true

    if @ad.save
      if params[:images]
        params[:images].each { |image|
          @ad.ad_photos.create(image: image)
        }
      end

     ad_photos = AdPhoto.where(token: params[:photos_token])

     ad_photos.each do |ad_photo|
       ad_photo.ad_id = @ad.id
       ad_photo.save
     end

      redirect_to @ad, notice: "Success! Ad is created."
    else
      render :new
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def edit
    @ad = Ad.find(params[:id])

    @car_makes = CarMake.all
    @car_models = CarModel.where(car_make_id: @ad.car_make_id)

    generate_photos_token

    cities_list
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update(ad_params)

    if params[:images]
      params[:images].each { |image|
        @ad.ad_photos.create(image: image)
      }
    end

    ad_photos = AdPhoto.where(token: params[:photos_token])

    ad_photos.each do |ad_photo|
      ad_photo.ad_id = @ad.id
      ad_photo.save
    end

    redirect_to ad_path(@ad)
  end

  def destroy
    @ad_photo = AdPhoto.find(params[:id])
    if @ad_photo.destroy
      render json: { message: "File deleted from server" }
    else
      render json: { message: @ad_photo.errors.full_messages.join(',') }
    end
  end

  def upload
    if params[:images]
      params[:images].each do |image|
        ad_photo = AdPhoto.new(image: image, token: params[:photos_token])
        ad_photo.save(validate: false)

        render json: { message: "success", fileID: ad_photo.id }, :status => 200
      end
    end
  end

  def get_subcategories
    @car_models = CarModel.where(car_make_id: params[:category_id])
  end

  def my_ads
    @ads = Ad.where(user_id: current_user.id).order("created_at DESC")
  end

  def favorite
    @ad = Ad.find(params[:id])
    type = params[:type]
    if type == "favorite" && !current_user.favorites.exists?(@ad.id)
      current_user.favorites << @ad
      redirect_to :back, notice: "You favorited #{@ad.title}"

    elsif type == "unfavorite"
      current_user.favorites.delete(@ad)
      redirect_to :back, notice: "Unfavorited #{@ad.title}"

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def ad_issue
    @ad_issue = AdIssue.new(ad_issue_params)

    if @ad_issue.save
      redirect_to :back, notice: 'Issue submitted'
    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def start_ad
    @ad = Ad.find(params[:id])
    @ad.active = true
    @ad.save

    redirect_to :back, notice: 'Ad started'
  end

  def stop_ad
    @ad = Ad.find(params[:id])
    @ad.active = false
    @ad.save

    redirect_to :back, notice: 'Ad stopped'
  end

  protected

  def ad_params
    params.require(:ad).permit(:title, :phone, :phone_additional, :price, :email, :website, :description, :user_id, :car_make_id, :car_model_id, :country, :city, ad_photos_attributes: [:id, :image, :_destroy],

    ad_tech_spec_attributes: [:id, :gearbox, :mileage, :built_year, :built_month, :inspection_year, :inspection_month, :power, :engine_cc, :new_car, :vin_number, :color, :body_type, :engine_type],

    ad_seats_option_attributes: [:id, :heated_seats, :back_heated_seats, :ventilated_seats, :back_ventilated_seats, :massage_seats, :back_massage_seats, :memory_seats, :electric_seats, :sport_seats, :seven_seats, :seats_material],

    ad_driving_option_attributes: [:id, :four_wheel_drive, :cruise_control, :adaptive_cruise_control, :spare_wheel, :tire_pressure, :start_stop],

    ad_multimedia_option_attributes: [:id, :navigation, :aux, :usb, :bluetooth, :roof_rack, :tv, :media_for_backseats],

    ad_lights_option_attributes: [:id, :xenon_lights, :bixenon_lights, :led_lights, :laser_lights, :adaptive_lights, :fog_lights, :daytime_lights],

    ad_safety_option_attributes: [:id, :lane_warning, :sign_recognition, :traction_control, :parktronic_back, :parktronic_front, :blind_spot_monitor, :collision_avoidance, :backup_camera, :surround_camera, :auto_parking, :night_vision],

    ad_comfort_option_attributes: [:id, :headup_display, :rain_sensor, :self_steering, :webasto, :keyless_entry, :softclose, :electric_windows, :electric_mirrors, :electric_trunk, :anti_dazzle_mirrors, :air_suspension, :air_conditioning, :auto_climate, :sunroof, :panoramic_roof, :isofix, :second_wheels, :tow_bar],

    ad_steering_option_attributes: [:id, :heated_st_wheel, :electric_st_wheel, :regulated_st_wheel, :multi_st_wheel, :memory_st_wheel, :wood_st_wheel])
  end

  def ad_issue_params
    params.require(:ad_issue).permit(:ad_id, :user_id, :reason)
  end

  private

  def generate_photos_token
    @photos_token = SecureRandom.base58(24)
  end

  def years_list
    @years = [ "2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001", "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993", "1992", "1991", "1990", "1985", "1980", "1975", "1970", "1965", "1960", "1900" ]
  end

  def capacity_list
    @capacity = [ "1.0", "1.2", "1.4", "1.6", "1.8", "2.0", "2.2", "2.5", "2.7", "3.0", "3.2", "3.5", "4.0", "5.0", "6.0" ]
  end

  def cities_list
    @cities = City.all
    @main_cities = City.where( main: true )
  end

end
