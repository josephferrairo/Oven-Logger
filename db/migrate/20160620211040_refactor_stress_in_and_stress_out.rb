class RefactorStressInAndStressOut < ActiveRecord::Migration
  def change
    remove_column :oven_logs, :stress_in_date, :date
    remove_column :oven_logs, :stress_in_time, :time
    remove_column :oven_logs, :stress_out_date, :date
    remove_column :oven_logs, :stress_out_time, :time

    remove_column :oven_logs, :her_in_date, :date
    remove_column :oven_logs, :her_in_time, :time
    remove_column :oven_logs, :her_out_date, :date
    remove_column :oven_logs, :her_out_time, :time

    add_column :oven_logs, :stress_in, :datetime
    add_column :oven_logs, :stress_out, :datetime
    add_column :oven_logs, :her_in, :datetime
    add_column :oven_logs, :her_out, :datetime
  end
end
