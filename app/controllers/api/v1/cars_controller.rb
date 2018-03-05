module Api
  module V1
    class CarsController < ApiController
      before_action :set_car, only: [:show, :edit, :update, :destroy]
      before_action do
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      end
      # GET /cars
      def index
        page_size = params[:page_size]
        @q = Car.all.ransack(params[:q])
        @q.sorts = 'created_at DESC' if @q.sorts.empty?
        @cars = @q.result
        @cars = @cars.page(params[:page])
        @cars = @cars.per(page_size) if !page_size.blank?
        render_success(:index, :ok,nil,@cars)
      end

      # GET /cars/:id
      def show
      end

      # GET /cars/new
      def new
        @car = Car.new
      end

      # GET /cars/:id/edit
      def edit
      end

      # POST /cars
      def create
        @car = Car.new(car_params)
        @car_type = CarsType.find (params[:car][:cars_type_id])
        @car.cars_type = @car_type
        if @car.valid? && @car.save
          render_success(:show, :created)
        else
          render_validation_error(:show, t('text.car_can_not_be_created'), 204)
        end
      end

      # PATCH/PUT /cars/:id
      def update
        if @car.update(car_params)
          render_success(:show, :updated)
        else
          render_validation_error(:show, t('text.car_can_not_be_updated'), 3000)
        end
      end

      # DELETE /cars/:id
      def destroy
        if @car.destroy
          render_success(:show, :deleted)
        else
          render_validation_error(:show, t('text.car_can_not_be_deleted'),3000)
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_car
        @car = Car.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def car_params
        params.require(:car).permit(:name, :horsepower, :price, :cars_type_id)
      end
    end
  end
end
