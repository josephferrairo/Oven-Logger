class OvenLogsController < ApplicationController
  def index
    @oven_log = OvenLog.all
  end

  def new
    @oven_log = OvenLog.new
  end

  def create
    @oven_log = current_user.oven_log.create(oven_log_params)
    if @oven_log.save
      flash[:success] = 'New log created!'
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @oven_log = OvenLog.find(params[:id])
  end

  private
  def oven_log_params
    params.require(:oven_log).permit(:customer, :work_order, :purchase_order, :operator)
  end
end
