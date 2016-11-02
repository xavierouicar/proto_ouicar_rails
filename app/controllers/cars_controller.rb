class CarsController < ApiController
  #before_action :user_verification
  before_action :set_car, only: [:show, :update, :destroy]
  before_action :set_cars, only: [:index]

  api :GET, '/user/:user_id/cars', 'Create a new :car belonging to the :user'
  param :user_id, String, 'Id of the :user', required: true
  def index
  end

  api :POST, '/user/:user_id/cars', 'Create a new :car belonging to the :user'
  param :user_id, String, 'Id of the :user', required: true
  param :registration, String, 'Registration code of the :car'
  param :model, String, 'Model of the :car'
  param :brand, String, 'Brand of the :car'
  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  api :GET, '/user/:user_id/cars/:id', 'Get a :car belonging to the :user'
  param :user_id, String, 'Id of the :user', required: true
  param :id, String, 'Id of the :car', required: true
  def show
  end

  api :PUT, '/user/:user_id/cars/:id', 'Update a :car belonging to the :user'
  param :user_id, String, 'Id of the :user', required: true
  param :id, String, 'Id of the :car', required: true
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  api :DELETE, '/user/:user_id/cars/:id', 'Delete a :car belonging to the :user'
  param :user_id, String, 'Id of the :user', required: true
  param :id, String, 'Id of the :car', required: true
  def destroy
    @car.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  protected

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_car
    set_user
    @car = @user.cars.where(id: params[:id]).first
  end

  def set_cars
    set_user
    @cars = @user.cars
  end

  def car_params
    permitted_params = params.require(:car).permit(
      :registration,
      :model,
      :brand
    )
    permitted_params['user'] = User.find(params[:user_id])
    permitted_params
  end
end
