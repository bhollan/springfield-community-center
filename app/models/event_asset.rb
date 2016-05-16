class EventAsset < ActiveRecord::Base
  belongs_to :event
  belongs_to :asset
  validate :quantity_available

  def quantity_available
    #sets error if quantity is present and is above max_quantity
    if quantity.present? && quantity > Asset.find(self.asset.id).max_quantity
      if self.asset.kind == 'chair'
        errors.add(:chair_quantity, "cannot be greater than available quantity.")
      elsif self.asset.kind == 'table'
        errors.add(:table_quantity, "cannot be greater than available quantity.")
      end
    end
  end

end
