class AddQuantityToEventAsset < ActiveRecord::Migration
  def change
    add_column :event_assets, :quantity, :integer, default: 1
  end
end
