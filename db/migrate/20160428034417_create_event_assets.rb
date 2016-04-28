class CreateEventAssets < ActiveRecord::Migration
  def change
    create_table :event_assets do |t|
      t.integer :event_id
      t.integer :asset_id

      t.timestamps null: false
    end
  end
end
