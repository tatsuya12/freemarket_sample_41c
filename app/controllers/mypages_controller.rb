class MypagesController < ApplicationController

  def credit
  end

  def credit_detail
  end

  def user_confirmation
  end

  def profile
  end

  def logout
  end

  def sign_up_top
    render :layout => 'no-header&pankuzu'
  end

  def show
    user = User.find(params[:id])
    @nickname = current_user.name
  end

end
