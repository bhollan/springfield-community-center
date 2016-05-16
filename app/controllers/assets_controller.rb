class AssetsController < ApplicationController
  def new
  end

  def create
  end

  def show
    # binding.pry
    #params[:id] will either be a kind ("tables", "chairs",...)...
    #...so we want to group them and render an index
    if Asset.kinds.keys.include? params[:id]
      @assets = Asset.where(kind: Asset.kinds.keys.index(params[:id]))
      @assets = @assets.sort{|one| one.event_assets.count}
      render 'index'
    #...or a normal id (4,6,2)
    else
      @asset = Asset.find_by(id: params[:id])
    end
  end

  def index
    @assets = Asset.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
