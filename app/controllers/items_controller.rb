class ItemsController < ApplicationController
  
  def index
    render :layout => 'no-pankuzu'
  end

  def show
  	render :layout => 'no-pankuzu'
  end

end
