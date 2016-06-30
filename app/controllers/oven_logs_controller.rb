class OvenLogsController < ApplicationController
  before_action :authenticate_user!

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

    respond_to do |format|
      format.html
      format.pdf do
        pdf = LogPdf.new(@oven_log)
        send_data pdf.render, filename: "#{@oven_log.customer} #{@oven_log.work_order}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
      end
    end
  end
  def edit
    @oven_log = OvenLog.find(params[:id])
  end

  def update
    @oven_log = OvenLog.find(params[:id])
    @oven_log.update_attributes(oven_log_params)
    if @oven_log.valid?
      redirect_to oven_logs_path
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    @oven_log = OvenLog.find(params[:id])
    @oven_log.destroy
    redirect_to oven_logs_path
  end
end

private
def oven_log_params
  params.require(:oven_log).permit(:customer, :work_order, :purchase_order, :stress_in, :stress_out,  :stress_asset, :her_in, :her_out, :her_asset, :operator)

end
