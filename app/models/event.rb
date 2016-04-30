class Event < ActiveRecord::Base
  has_many :event_assets
  has_many :assets, through: :event_assets
  belongs_to :user
  validate :public_events_must_register_early

  def public_events_must_register_early
    binding.pry
  end
end
