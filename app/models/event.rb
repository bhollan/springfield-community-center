class Event < ActiveRecord::Base
  has_many :event_assets
  has_many :assets, through: :event_assets
  belongs_to :user
  validates_associated :event_assets

  def chairs
    self.assets.select{|ass| ass.kind=='chair'}
  end
  def chair_ea
    chair_ea = self.event_assets.select{|ea| ea.asset.kind=='chair'}.first
  end
  def chair_quantity=(chair_num)
    if !chair_ea.nil?
      chair_ea.update(quantity: chair_num)
    end
  end
  def chair_quantity
    if !chair_ea.nil?
      self.chair_ea.quantity
    end
  end

  def tables
    self.assets.select{|ass| ass.kind=='table'}
  end
  def table_ea
    table_ea = self.event_assets.select{|ea| ea.asset.kind=='table'}.first
  end
  def table_quantity=(table_num)
    if !table_ea.nil?
      table_ea.update(quantity: table_num)
    end
  end
  def table_quantity
    if !table_ea.nil?
      table_ea.quantity
    end
  end
end
