class MypagesController < ApplicationController

  def credit
    render :layout => 'add-header&pankuzu'
  end

  def credit_detail
    render :layout => 'add-header&pankuzu'
  end

  def user_confirmation
    render :layout => 'add-header&pankuzu'
  end

  def profile
    render :layout => 'add-header&pankuzu'
  end

  def logout
    render :layout => 'add-header&pankuzu'
  end

  def sign_up_top
  end

  def show
    user = User.find(params[:id])
    @nickname = current_user.name
    render :layout => 'add-header&pankuzu'
  end

end
