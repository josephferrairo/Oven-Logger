class CreateOvenLogs < ActiveRecord::Migration
  def change
    create_table :oven_logs do |t|
      t.string :customer
      t.string :work_order
      t.string :purchase_order
      t.date :stress_in_date
      t.time :stress_in_time
      t.date :stress_out_date
      t.time :stress_out_time
      t.string :stress_asset

      t.date :her_in_date
      t.time :her_in_time
      t.date :her_out_date
      t.time :her_out_time
      t.string :stress_asset
      t.string :operator
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :oven_logs, :user_id
  end
end
