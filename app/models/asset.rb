class Asset < ActiveRecord::Base
  has_many :event_assets
  has_many :events, through: :event_assets

  def self.kinds
    [:room, :projector, :speaker, :chair, :table]
  end

  enum kind: self.kinds

  def num_of_events
    self.events.count
  end

  def most_rented_of_same_kind
    set = Asset.where(kind: self[:kind])
    set.max_by{|one| one.num_of_events}
  end

  def self.most_rented_asset
    Asset.all.max_by{|one| one.num_of_events}
  end
end
