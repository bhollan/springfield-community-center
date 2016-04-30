class ChangeEventTimeToEventDate < ActiveRecord::Migration
  def change
    rename_column :events, :event_time, :event_date
  end
end
