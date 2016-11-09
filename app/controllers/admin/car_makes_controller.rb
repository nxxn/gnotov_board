class Admin::CarMakesController < AdminController

  def index
    @car_makes = CarMake.all.order("name DESC")

    @car_make  = CarMake.new
    @car_model = CarModel.new
  end

  def new
    @model = CarMake.new
  end

  def create
    @model = CarMake.new(model_params)
    if @model.save
      redirect_to @model
    else

    end
  end

  def show
    @model = CarMake.find(params[:id])
  end

  def edit
    @model = CarMake.find(params[:id])
  end

  def update
    @model = CarMake.find(params[:id])
    @model.update(model_params)
    redirect_to model_path(@model)
  end

  def destroy
    @model = CarMake.find(params[:id])

    @model.destroy

    redirect_to admin_models_path
  end

  def stop_model
    @model = CarMake.find(params[:id])

    if @model.active?
      @model.active = false
    else
      @model.active = true
    end

    @model.save

    redirect_to admin_models_path
  end

  def was_paid
    @model = CarMake.find(params[:id])

    @model.paid = true

    @model.save

    redirect_to admin_models_path
  end

  def new_car_make
    @make = CarMake.new(make_params)

    if @make.save
      redirect_to :back, notice: 'Manufacturer created'
    end
  end

  def new_car_model
    @model = CarModel.new(model_params)

    if @model.save
      redirect_to :back, notice: 'Model created'
    end
  end

  protected

  def model_params
    params.require(:car_model).permit(:car_make_id, :name)
  end

  def make_params
    params.require(:car_make).permit(:name)
  end

end
