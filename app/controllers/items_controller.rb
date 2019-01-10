class ItemsController < ApplicationController

  def index
  	@items = Item.includes(:user)
  end

  def show
  end

end
