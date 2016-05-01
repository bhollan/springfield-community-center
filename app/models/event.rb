class Event < ActiveRecord::Base
  has_many :event_assets
  has_many :assets, through: :event_assets
  belongs_to :user
  validate :cannot_create_past_event

  def cannot_create_past_event
  end
end
