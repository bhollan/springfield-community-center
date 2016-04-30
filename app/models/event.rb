class Event < ActiveRecord::Base
  has_many :event_assets
  has_many :assets, through: :event_assets
  belongs_to :user
end
