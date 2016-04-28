require 'rails_helper'
#
# class AssetTest < ActiveSupport::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end

RSpec.describe Asset, type: :model do
  before :each do
    @asset1 = Asset.create(name:Panasonic1, type:'projector')
  end
end
