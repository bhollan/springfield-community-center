class Asset < ActiveRecord::Base
  has_many :event_assets
  has_many :events, through: :event_assets

  def self.kinds
    [:room, :projector, :speaker, :chair, :table]
  end

  enum kind: self.kinds

end
