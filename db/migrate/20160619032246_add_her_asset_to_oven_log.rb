class AddHerAssetToOvenLog < ActiveRecord::Migration
  def change
    add_column :oven_logs, :her_asset, :string
  end
end
