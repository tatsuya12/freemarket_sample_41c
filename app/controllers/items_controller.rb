class ItemsController < ApplicationController

  def index
  	@items = Item.limit(4).order("created_at DESC")
  end

  def show
  end

end
