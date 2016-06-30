class LogPdf < Prawn::Document
  def initialize(oven_log)
    super()
    @oven_log = oven_log
    text_data
    table_data
  end

  def text_data
    text "Customer: #{@oven_log.customer}"
    text "Work Order: #{@oven_log.work_order}"
    text "Purchase Order: #{@oven_log.purchase_order}"
    text "Operator: #{@oven_log.operator}"

  end

  def table_data
    move_down 20
    table([
       ["Stress in", "Stress Out", "Asset", "HER in",
      "HER out", "Asset"],
            ["#{@oven_log.stress_in}", "#{@oven_log.stress_out}", "#{@oven_log.stress_asset}", "#{@oven_log.her_in}", "#{@oven_log.her_out}", "#{@oven_log.her_asset}"],

     ])



  end
end
