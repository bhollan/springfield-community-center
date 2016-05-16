class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :event_date
      t.integer :user_id
      t.string :title
      t.boolean :public, default: true

      t.timestamps null: false
    end
  end
end
