class Asset < ActiveRecord::Base
  has_many :event_assets
  has_many :events, through: :event_assets

  enum kind: [:room, :projector, :speaker, :chairs, :tables]

  def next_available
    #returns next availble date/time this asset is available
  end

  def self.available_on(request_date)
    #returns array of assets available on a given date
  end
end
