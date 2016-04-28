class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :event_time
      t.integer :owner_id
      t.boolean :public, default: true

      t.timestamps null: false
    end
  end
end
