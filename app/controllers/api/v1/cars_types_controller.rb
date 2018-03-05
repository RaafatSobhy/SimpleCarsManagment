module Api
  module V1
    class CarsTypesController < ApiController
      before_action :set_cars_type, only: [:show, :edit, :update, :destroy]

      # GET /cars_types
      # GET /cars_types.json
      def index
        page_size = params[:page_size]
        @q = CarsType.all.ransack(params[:q])
        @q.sorts = 'created_at DESC' if @q.sorts.empty?
        @cars_types = @q.result
        @cars_types = @cars_types.page(params[:page])
        @cars_types = @cars_types.per(page_size) if !page_size.blank?
        render_success(:index, :ok,nil,@cars_types)
      end

      # GET /cars_types/1
      # GET /cars_types/1.json
      def show
      end

      # GET /cars_types/new
      def new
        @cars_type = CarsType.new
      end

      # GET /cars_types/1/edit
      def edit
      end

      # POST /cars_types
      # POST /cars_types.json
      def create
        @cars_type = CarsType.new(cars_type_params)
        if @cars_type.valid? && @cars_type.save
          render_success(:show, :created)
        else
          render_validation_error(:show, t('text.car_type_can_not_be_created'), 204)
        end
      end

      # PATCH/PUT /cars_types/1
      # PATCH/PUT /cars_types/1.json
      def update
        if @cars_type.update(cars_type_params)
          render_success(:show, :updated)
        else
          render_validation_error(:show, t('text.car_type_can_not_be_updated'), 3000)
        end
      end

      # DELETE /cars_types/1
      # DELETE /cars_types/1.json
      def destroy
        if @cars_type.destroy
          render_success(:show, :deleted)
        else
          render_validation_error(:show, t('text.car_type_can_not_be_deleted'),3000)
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_cars_type
        @cars_type = CarsType.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cars_type_params
        params.require(:cars_type).permit(:car_type)
      end
    end
  end
end
