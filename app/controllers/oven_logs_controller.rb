class OvenLogsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @oven_log = OvenLog.all
    @oven_logs_grid = initialize_grid(OvenLog,
    order: 'oven_logs.customer',
    order_direction: 'asc'
    )
  end

  def new
    @oven_log = OvenLog.new
  end

  def create
    @oven_log = current_user.oven_logs.create(oven_log_params)
    if @oven_log.save
      flash[:success] = 'New log created!'
      redirect_to oven_logs_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @oven_log = OvenLog.find(params[:id])
  end

  private
  def oven_log_params
    params.require(:oven_log).permit(:customer, :work_order, :purchase_order, :stress_in_date, :stress_in_time, :stress_out_date, :stress_out_time, :stress_asset, :her_in_date, :her_in_time, :her_out_time, :her_out_date, :her_asset, :operator)
  end
end
