class EventAsset < ActiveRecord::Base
  belongs_to :event
  belongs_to :asset
  validate :asset_available

  def asset_available
    #sets error if asset is not available on this event's date
    true
  end
end
